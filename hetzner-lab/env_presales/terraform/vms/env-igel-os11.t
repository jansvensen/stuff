# Data source to get information about the Igel OS image
data "vsphere_virtual_machine" "igel_os11" {
  name          = var.vsphere.image_igel_os11  # Name of the Igel OS image
  datacenter_id = data.vsphere_datacenter.dc.id    # Reference to the ID of the associated vSphere datacenter
}

# Resource block to create virtual machines of type "igel_os11"
resource "vsphere_virtual_machine" "igel_os11" {

  for_each = var.machine_igel_os11  # Create one VM for each entry in the machine_igel_os11 map

  name             = "${var.vm-all.env_prefix}-${each.value.name}"  # Constructing the VM name
  resource_pool_id = data.vsphere_host.host.resource_pool_id        # Reference to the ID of the associated vSphere resource pool
  datastore_id     = data.vsphere_datastore.datastore.id            # Reference to the ID of the associated vSphere datastore
  
  num_cpus = 2
  memory   = 4096
  guest_id = data.vsphere_virtual_machine.igel_os11.guest_id  # Reference to the ID of the Igel OS image

  network_interface {
    network_id = data.vsphere_network.network.id  # Reference to the ID of the associated vSphere network
  }

  disk {
    label = "disk0"
    size  = data.vsphere_virtual_machine.igel_os11.disks.0.size  # Size of the VM disk
  }

  cdrom {
    client_device = true  # Use the client device for CD-ROM
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.igel_os11.id  # Reference to the ID of the Igel OS image
    linked_clone  = false  # Create a full clone of the template
  } 

  wait_for_guest_ip_timeout = -1

}