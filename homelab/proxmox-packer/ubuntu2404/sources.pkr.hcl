source "proxmox-iso" "ubuntu" {
  
  proxmox_url              = var.proxmox.url
  node                     = var.proxmox.node
  username                 = var.proxmox.username
  password                 = var.proxmox.password
  insecure_skip_tls_verify = var.proxmox.insecure_skip_tls_verify

  cores = var.vm.cpu_cores
  memory    = var.vm.memory
  os        = var.vm.os

  boot_wait      = var.packer.boot_wait
  http_directory = var.packer.http_directory

  boot_command = [
    "c<wait>",
    "linux /casper/vmlinuz -- autoinstall ds='nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/'",
    "<enter><wait><wait>",
    "initrd /casper/initrd",
    "<enter><wait><wait>",
    "boot<enter>"
  ]    

  disks {
    disk_size    = var.vm.disk_size
    format       = var.proxmox.storage_format
    storage_pool = var.proxmox.storage_pool
    type         = var.vm.disk_type
  }
  scsi_controller = var.vm.scsi_controller
    
  iso_file = "${var.proxmox.iso_storage_pool}/${var.ubuntu2404.iso_file}"

  template_description = var.template.description
  template_name        = var.template.name
  
  network_adapters {
    bridge = "vmbr0"
  }  
  
  ssh_port     = var.ssh.port
  ssh_timeout  = var.ssh.timeout
  ssh_username = var.ssh.username
  ssh_password = var.ssh.password
  
}