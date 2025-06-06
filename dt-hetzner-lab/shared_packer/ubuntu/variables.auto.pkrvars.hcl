# vSphere Variables
vsphere_server          = "10.10.99.4"
vsphere_username        = "administrator@vsphere.local"
vsphere_password        = "deviceTRUST!2022"
vsphere_datacenter      = "hetzner-lab"
vsphere_host            = "10.10.99.3"
vsphere_network         = "vSwitch_Internal_Test"
vsphere_datastore       = "VM"

# cloud_init files for unattended configuration for Ubuntu
cloudinit_userdata      = "./http/user-data"
cloudinit_metadata      = "./http/meta-data"

# final clean up script
shell_scripts           = ["./setup/setup.sh"]

# SSH username (created in user-data. If you change it here the please also adjust in ./html/user-data)
ssh_username            = "vagrant"

# SSH password (created in autounattend.xml. If you change it here the please also adjust in ./html/user-data)
ssh_password            = "vagrant"