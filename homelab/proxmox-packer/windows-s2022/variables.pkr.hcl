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