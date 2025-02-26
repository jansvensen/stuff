source "vsphere-iso" "windows" {
  vcenter_server        = "${var.vsphere_server}"
  host                  = "${var.vsphere_host}"
  username              = "${var.vsphere_username}"
  password              = "${var.vsphere_password}"
  insecure_connection   = "true"
  datacenter            = "${var.vsphere_datacenter}"
  datastore             = "${var.vsphere_datastore}"

  CPUs                  = "${var.vm_cpu_num}"
  RAM                   = "${var.vm_mem_size}"
  RAM_reserve_all       = true
  disk_controller_type  = ["pvscsi"]
  # firmware            = "bios"
  floppy_files          = ["${var.autounattend_file}", "setup/setup.ps1", "setup/vmtools.cmd", "setup/appx.ps1", "setup/Install-VMTools.ps1", "setup/Enable-WinRM.ps1"]
  floppy_img_path       = "${var.vm_floppy_pvscsi}"
  guest_os_type         = "${var.guest_os_type}"
  iso_checksum          = "${var.os_iso_checksum}"
  iso_url               = "${var.os_iso_url}"
  iso_paths             = ["${var.vm_vmtools_iso_path}"]

  network_adapters {
    network             = "${var.vsphere_network}"
    network_card        = "vmxnet3"
  }

  storage {
    disk_size             = "${var.vm_disk_size}"
    disk_thin_provisioned = true
  }

  vm_name               = "${var.vm_name}"
  convert_to_template   = "true"
  communicator          = "winrm"
  winrm_username        = "${var.winrm_username}"
  winrm_password        = "${var.winrm_password}"
  winrm_timeout         = "3h"

  shutdown_timeout      = "60m"

  ip_wait_timeout       = "3h"
  ip_settle_timeout     = "2m"
}

build {
  sources = ["source.vsphere-iso.windows"]

  provisioner "windows-update" {
    search_criteria = "IsInstalled=0"
    filters = [
     "exclude:$_.Title -like '*Preview*'",
      "include:$true",
    ]
    update_limit = 50
  }
}