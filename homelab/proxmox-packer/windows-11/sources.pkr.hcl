source "proxmox-iso" "windows-11" {
  # Proxmox Host Connection
  proxmox_url              = var.proxmox.url
  insecure_skip_tls_verify = var.proxmox.insecure_skip_tls_verify
  username                 = var.proxmox.username
  password                 = var.proxmox.password
  node                     = var.proxmox.node

  # VM Configuration
  vm_name              = "win11-${var.template.name}"
  template_name        = var.template.name
  template_description = var.template.description
  os                   = var.vm.os
  cpu_type             = "host"
  cores                = var.vm.cpu_cores
  memory               = var.vm.memory
  scsi_controller      = "virtio-scsi-pci"
  qemu_agent           = true

  # Network Configuration
  network_adapters {
    bridge   = "vmbr0"
    firewall = false
    model    = "e1000"
  }

  # Storage Configuration
  disks {
    disk_size    = var.vm.disk_size
    format       = var.proxmox.storage_format
    storage_pool = var.proxmox.storage_pool
    type         = var.vm.disk_type
  }

  # ISO and Boot Configuration
  boot_iso {
    type     = "scsi"
    iso_file = "${var.proxmox.iso_storage_pool}/${var.windows-11.iso_file}"
  }

  # Additional ISO Files
  additional_iso_files {
    cd_files = [
      "windows-11/files/autounattend.xml",
      "windows-11/files/setup.ps1",
      "windows-11/files/Enable-WinRM.ps1"
    ]
    cd_label         = "cidata"
    iso_storage_pool = "local"
    type             = "scsi"
  }

  additional_iso_files {
    type             = "scsi"
    iso_storage_pool = var.proxmox.iso_storage_pool
    iso_file         = "${var.proxmox.iso_storage_pool}/virtio-win.iso"
  }

  # WinRM Configuration
  communicator   = "winrm"
  winrm_username = var.winrm.username
  winrm_password = var.winrm.password
  winrm_timeout  = var.winrm.timeout
  winrm_port     = var.winrm.port
  winrm_use_ssl  = var.winrm.use_ssl
  winrm_insecure = var.winrm.insecure

}