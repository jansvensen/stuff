variable proxmox_server {
  type = string
  default = ""
}

variable proxmox_username {
  type = string
  default = ""
}

variable proxmox_password {
  type = string
  default = ""
}

variable proxmox_datacenter {
  type = string
  default = ""
}

variable proxmox_host {
  type = string
  default = ""
}

variable proxmox_network {
  type = string
  default = ""
}

variable proxmox_datastore {
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

variable "proxmox" {
  type = object({
    node                     = string
    url                      = string
    host                     = string
    storage_pool             = string
    username                 = string
    password                 = string
    iso_storage_pool         = string
    insecure_skip_tls_verify = string
    pool                     = string
    storage_format           = string
  })
}

variable "ssh" {
  type = object({
    username = string
    password = string
    timeout  = string
    port     = number
  })
}

variable "packer" {
  type = object({
    boot_wait      = string
    task_timeout   = string
    http_directory = string
  })
}

variable "template" {
  type = object({
    name        = string
    description = string
  })
}

variable "windowss2022" {
  type = object({
    iso_file     = string
    iso_checksum = string
  })
}

variable "vm" {
  type = object({
    os                      = string
    cpu_cores               = number
    memory                  = number
    disk_size               = string
    disk_type               = string
    scsi_controller         = string
    locale                  = string
    timezone                = string
    keyboard_layout         = string
    cloud_init_apt_packages = list(string)
    efi_storage_pool        = string
    pre_enrolled_keys       = bool
    efi_type                = string
  })
}

variable "winrm" {
  type = object({
    username = string
    password = string
    timeout  = string
    port     = string
    use_ssl  = bool
    insecure = bool
  })
}