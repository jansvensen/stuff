build {
  sources = [
    "source.proxmox-iso.ubuntu"
  ]

  # Wait for cloud-init to complete after reboot
  provisioner "shell" {
    inline = ["while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 1; done", "sudo rm -f /etc/cloud/cloud.cfg.d/99-installer.cfg", "sudo cloud-init clean", "sudo passwd -d ubuntu"]
  }

  # Clean up subiquity installer
  provisioner "shell" {
    execute_command = "sudo /bin/sh -c '{{ .Vars }} {{ .Path }}'"
    inline = [
      "cloud-init clean --machine-id --logs",
      "if [ -f /etc/cloud/cloud.cfg.d/99-installer.cfg ]; then rm /etc/cloud/cloud.cfg.d/99-installer.cfg; echo 'Deleting subiquity cloud-init config'; fi",
      "if [ -f /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg ]; then rm /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg; echo 'Deleting subiquity cloud-init network config'; fi",
    ]
  }
}