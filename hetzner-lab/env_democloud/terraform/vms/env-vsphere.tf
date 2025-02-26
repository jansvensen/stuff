data "vsphere_datacenter" "dc" {
  name = var.vsphere.datacenter
}

data "vsphere_host" "host" {
  name          = var.vsphere.host
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere.datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vsphere.network
  datacenter_id = data.vsphere_datacenter.dc.id
}