winrm = {
  "username" = "vagrant"
  "password" = "vagrant"
  "timeout"  = "12h"
  "port"     = "5986"
  "use_ssl"  = true
  "insecure" = true
}

vm = {
    "os"                      = "win11"
    "cpu_cores"               = 2
    "memory"                  = 4096
    "disk_size"               = "10G"
    "disk_type"               = "scsi"
    "scsi_controller"         = "virtio-scsi-single"
    "locale"                  = "en_US"
    "timezone"                = "Etc/UTC"
    "keyboard_layout"         = "de"
    "cloud_init_apt_packages" = []
    "efi_storage_pool"          = "local-lvm"
    "pre_enrolled_keys"         = true
    "efi_type"                  = "4m"
}

windows-11 = {
    "iso_file"     = "Win11_22H2_ENT_EN.iso"
    "iso_checksum" = ""
}

template = {
    "name"        = "tmp-windows-11"
    "description" = "Nope"
}

