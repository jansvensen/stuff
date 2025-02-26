variable vsphere_server {
  type = string
  default = ""
}

variable vsphere_username {
  type = string
  default = ""
}


variable vsphere_password {
  type = string
  default = ""
}

variable vsphere_datacenter {
  type = string
  default = ""
}

variable vsphere_host {
  type = string
  default = ""
}

variable vsphere_network {
  type = string
  default = ""
}

variable vsphere_datastore {
  type = string
  default = ""
}

variable winrm_password {
  type = string
  default = ""
}

variable winrm_username {
  type = string
  default = ""
}

variable vm_cpu_num {
  type = string
  default = ""
}

variable vm_disk_size {
  type = string
  default = ""
}

variable vm_mem_size {
  type = string
  default = ""
}

variable vm_vmtools_iso_path {
  type = string
  default = ""
}

variable vm_floppy_pvscsi {
  type = string
  default = ""
}

variable os_iso_checksum {
  type = string
  default = ""
}

variable os_iso_url {
  type = string
  default = ""
}

variable vm_name {
  type = string
  default = ""
}

variable autounattend_file {
  type = string
  default = ""
}

variable guest_os_type {
  type = string
  default = ""
}

variable cloudinit_userdata {
  type = string
  default = ""
}

variable shell_scripts {
  type = list(string)
  description = "A list of scripts."
  default = []
}

variable cloudinit_metadata {
  type = string
  default = ""
}