# Data source to get information about the Ubuntu 22.04 image
data "vsphere_virtual_machine" "ubuntu2204" {
  name          = var.vsphere.image_ubuntu2204   # Name of the Ubuntu 22.04 image
  datacenter_id = data.vsphere_datacenter.dc.id    # Reference to the ID of the associated vSphere datacenter
}

# Resource block to create virtual machines of type "inf-logging"
resource "vsphere_virtual_machine" "inf-logging" {

  for_each = var.machine_ubuntu2204  # Create one VM for each entry in the machine_ubuntu2204 map

  name             = "${var.vm-all.env_prefix}-${each.value.name}"  # Constructing the VM name
  resource_pool_id = data.vsphere_host.host.resource_pool_id        # Reference to the ID of the associated vSphere resource pool
  datastore_id     = data.vsphere_datastore.datastore.id            # Reference to the ID of the associated vSphere datastore
  
  num_cpus = 2
  memory   = 4096
  guest_id = data.vsphere_virtual_machine.ubuntu2204.guest_id  # Reference to the ID of the Ubuntu 22.04 image

  network_interface {
    network_id = data.vsphere_network.network.id  # Reference to the ID of the associated vSphere network
  }

  disk {
    label = "disk0"
    size  = data.vsphere_virtual_machine.ubuntu2204.disks.0.size  # Size of the VM disk
  }

  cdrom {
    client_device = true  # Use the client device for CD-ROM
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.ubuntu2204.id  # Reference to the ID of the Ubuntu 22.04 image
    linked_clone  = false  # Create a full clone of the template

    customize {

      linux_options {
        host_name = "${each.value.name}"  # Set the hostname
        domain    = "dt.democloud"  # Set the domain
      }

      network_interface {
        ipv4_address = "${each.value.ip}"  # Set the IPv4 address
        ipv4_netmask = 24  # Set the IPv4 netmask
      }

      ipv4_gateway    = var.vm-all.ipv4_gateway  # Set the IPv4 gateway
      dns_server_list = [var.vm-all.dns_server_list]  # Set the DNS server list
    }
  } 
}