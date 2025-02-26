ubuntu2404 = {
    "iso_file"     = "ubuntu-24.04.1-live-server-amd64.iso"
    "iso_checksum" = "e240e4b801f7bb68c20d1356b60968ad0c33a41d00d828e74ceb3364a0317be9"
}

template = {
    "name"        = "tmp-ubuntu-24.04.1"
    "description" = "Nope"
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