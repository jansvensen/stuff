packer {
  required_plugins {
    vsphere = {
      version = ">= 1.2.3"
      source  = "github.com/hashicorp/vsphere"
    }

    windows-update = {
      version = ">=0.15.0"
      source = "github.com/rgl/windows-update"
    }
  }
}