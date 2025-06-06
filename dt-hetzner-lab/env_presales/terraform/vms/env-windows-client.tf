# Data source to get information about the Windows 10 Client image
data "vsphere_virtual_machine" "win10" {
  name          = var.vsphere.image_win10      # Name of the Windows 10 Client image
  datacenter_id = data.vsphere_datacenter.dc.id  # Reference to the ID of the associated vSphere datacenter
}

# Resource block to create virtual machines of type "win10"
resource "vsphere_virtual_machine" "win10" {

  for_each = var.machine_win10  # Create one VM for each entry in the machine_win10 map

  name             = "${var.vm-all.env_prefix}-${each.value.name}"  # Constructing the VM name
  resource_pool_id = data.vsphere_host.host.resource_pool_id        # Reference to the ID of the associated vSphere resource pool
  datastore_id     = data.vsphere_datastore.datastore.id            # Reference to the ID of the associated vSphere datastore
  
  num_cpus = "${each.value.cpus}"
  memory   = "${each.value.memory}"
  guest_id = data.vsphere_virtual_machine.win10.guest_id  # Reference to the ID of the Windows 10 Client image

  network_interface {
    network_id = data.vsphere_network.network.id  # Reference to the ID of the associated vSphere network
  }

  disk {
    label = "disk0"
    size  = data.vsphere_virtual_machine.win10.disks.0.size  # Size of the VM disk
  }

  cdrom {
    client_device = true  # Use the client device for CD-ROM
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.win10.id  # Reference to the ID of the Windows 10 Client image
    linked_clone  = false  # Create a full clone of the template

    customize {
      windows_options {
        computer_name = "${each.value.name}"  # Set the computer name for Windows 10 Client
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