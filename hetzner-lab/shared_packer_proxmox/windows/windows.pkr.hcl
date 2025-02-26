source "proxmox-iso" "windows" {
  # Proxmox Host Connection
  proxmox_url              = var.proxmox.url
  insecure_skip_tls_verify = var.proxmox.insecure_skip_tls_verify
  username                 = var.proxmox.username
  password                 = var.proxmox.password
  node                     = var.proxmox.node

  # VM Configuration
  os                   = var.vm.os
  cpu_type             = "host"
  cores                = var.vm.cpu_cores
  memory               = var.vm.memory
  scsi_controller      = "virtio-scsi-pci"
  # qemu_agent           = true

  # ISO and Boot Configuration

    #type     = "scsi"
    iso_file = "${var.proxmox.iso_storage_pool}/${var.windowss2022.iso_file}"

  # Network Configuration
  network_adapters {
    bridge   = "vmbr0"
    firewall = false
    # model    = "e1000"
  }

  # Storage Configuration
  disks {
    disk_size    = var.vm.disk_size
    format       = var.proxmox.storage_format
    storage_pool = var.proxmox.storage_pool
    type         = var.vm.disk_type
  }

  vm_name               = var.vm_name
  communicator          = "winrm"
  winrm_username        = var.winrm_username
  winrm_password        = var.winrm_password
  winrm_timeout         = "3h"
}

build {
  sources = ["source.proxmox-iso.windows"]

  provisioner "windows-update" {
    search_criteria = "IsInstalled=0"
    filters = [
     "exclude:$_.Title -like '*Preview*'",
      "include:$true",
    ]
    update_limit = 50
  }
}