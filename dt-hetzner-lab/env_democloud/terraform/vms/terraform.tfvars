# Variables for the deployment in vSphere
vsphere = ({
  server           = "10.10.99.4"
  user             = "administrator@vsphere.local"
  password         = "deviceTRUST!2022"#
  datacenter       = "hetzner-lab"
  host             = "10.10.99.3"
  datastore        = "VM"
  network          = "vSwitch_Internal_Dem"
  image_ubuntu2204 = "i-ubuntu-2204"
  image_s2022      = "image-s2022-eval"
  image_win10      = "image-win10-eval"
  timezone         = 020
  resourcepool     = "Democloud"
})

# Generic VM variables
vm-all = ({  
  ipv4_gateway    = "10.10.1.1"
  dns_server_list = "10.10.1.10"
  env_prefix      = "dem"
  domain          = "democloud"
})

# Windows Server 2022 machines
machine_s2022 = {
  inf-dc-01 = {
    name   = "inf-dc-01"  # Server name
    ip     = "10.10.1.10" # Server IP address
    cpus   = "2"
    memory = "4096"
  }
  ctx-ctrl-01 = {
    name   = "ctx-ctrl-01"  # Server name
    ip     = "10.10.1.101"  # Server IP address
    cpus   = "2"
    memory = "8192"
  }
  ctx-rdsh-01 = {
    name   = "ctx-rdsh-01"  # Server name
    ip     = "10.10.1.102"  # Server IP address
    cpus   = "2"
    memory = "4096"
  }
}

# Ubuntu 22.04 machines
machine_ubuntu2204 = {
  inf-logging-01 = {
    name = "inf-logging-01" # Server name
    ip   = "10.10.1.151"    # Server IP address
    cpus   = "2"
    memory = "4096"
  }
}