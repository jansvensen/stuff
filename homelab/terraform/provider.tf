terraform {
  required_version = ">= 1.1.0"
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = ">= 2.9.5"
    }
  }
}

provider "proxmox" {
    pm_api_url = var.proxmox_host.pm_api_url
    pm_user = var.proxmox_host.pm_user
    pm_password = var.proxmox_host.pm_password
}