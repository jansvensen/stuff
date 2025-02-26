# see */packer.pkr.hcl for a full list of possible variable values to override here
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

