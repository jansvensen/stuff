#####
# proxmox attributes
##### 
proxmox_server      = "192.168.110.99"
proxmox_username    = "root"
proxmox_password    = "Banane2000!"
proxmox_datastore   = "VM"

#####
# VM attributes
##### 
vm_cpu_num          = 2
vm_disk_size        = 102400
vm_mem_size         = 4096

#####
# WinRM attributes / Needs to match "/http/user-data"
##### 
winrm_username      = "vagrant"
winrm_password      = "vagrant"

#####
# Cloud init files / required for unattended installation
##### 
cloudinit_userdata  = "./http/user-data"
cloudinit_metadata  = "./http/meta-data"

#####
# Cleanup script
##### 
shell_scripts       = ["./setup/setup.sh"]

proxmox = {
    "node"                     = "inf-proxmox-01"
    "url"                      = "https://192.168.110.99:8006/api2/json"
    "host"                     = "192.168.110.99"
    "storage_pool"             = "local-lvm"
    "username"                 = "root@pam"
    "password"                 = "Banane2000!"
    "iso_storage_pool"         = "local:iso"
    "insecure_skip_tls_verify" = "true"
    "pool"                     = "local-lvm"
    "storage_format"           = "raw"
}

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

windowss2022 = {
    "iso_file"     = "SERVER2022_EVAL_x64FRE_en-us.iso"
    "iso_checksum" = ""
}

template = {
    "name"        = "tmp-windows-server2022"
    "description" = "Nope"
}

ssh = {
    "username" = "ubuntu"
    "password" = "ubuntu"
    "timeout"  = "30m"
    "port"     = 22
}

packer = {
    "boot_wait"    = "10s"
    "task_timeout" = "60m"
    "http_directory" = "ubuntu2404/http"
}
