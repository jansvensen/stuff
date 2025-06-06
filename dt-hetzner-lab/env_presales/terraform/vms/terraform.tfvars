# Variables for the deployment in vSphere
vsphere = ({
  server                   = "10.10.99.4"
  user                     = "administrator@vsphere.local"
  password                 = "deviceTRUST!2022"#
  datacenter               = "hetzner-lab"
  host                     = "10.10.99.3"
  datastore                = "VM"
  network                  = "vSwitch_Internal_Pre"
  image_ubuntu2204         = "image-ubuntu-2204"
  image_s2022              = "image-s2022-eval"
  image_win10              = "image-win10-eval"
  image_igel_os11          = "image-igel-os11"
  image_igel_os12          = "image-igel-os12"
  timezone                 = 020
  resourcepool             = "Presales"
})

# Generic VM variables
vm-all = ({  
  ipv4_gateway    = "10.10.2.1"
  dns_server_list = "10.10.2.10"
  env_prefix      = "pre"
  domain          = "presales"
})

# Windows Server 2022 machines
machine_s2022 = {
  inf-dc-01 = {
    name   = "inf-dc-01"  # Server name
    ip     = "10.10.2.10" # Server IP address
    cpus   = "2"
    memory = "4096"
  }
  ctx-ctrl-01 = {
    name   = "ctx-ctrl-01"  # Server name
    ip     = "10.10.2.101"  # Server IP address
    cpus   = "2"
    memory = "8192"
  }
  ctx-rdsh-01 = {
    name   = "ctx-rdsh-01"  # Server name
    ip     = "10.10.2.102"  # Server IP address
    cpus   = "2"
    memory = "4096"
  }
  prl-ras-01 = {
    name   = "prl-ras-01"  # Server name
    ip     = "10.10.2.111"  # Server IP address
    cpus   = "2"
    memory = "4096"
  }
}

# Windows 10 machines
machine_win10 = {
  client-win10-01 = {
    name   = "client-win10-01"  # Server name
    ip     = "10.10.2.121" # Server IP address
    cpus   = "2"
    memory = "4096"
  }
  client-win10-02 = {
    name   = "client-win10-02"  # Server name
    ip     = "10.10.2.122" # Server IP address
    cpus   = "2"
    memory = "4096"
  }
}

# Ubuntu 22.04 machines
machine_ubuntu2204 = {
  inf-logging-01 = {
    name   = "inf-logging-01" # Server name
    ip     = "10.10.2.151"    # Server IP address
    cpus   = "2"
    memory = "4096"
  }
  inf-guac-01 = {
    name   = "inf-guac-01" # Server name
    ip     = "10.10.2.161"    # Server IP address
    cpus   = "2"
    memory = "4096"
  }
}

# Ubuntu 22.04 desktop machines
machine_ubuntu2204_desktop = {
  igel-cosmosg-01 = {
    name   = "igel-cosmosg-01" # Server name
    ip     = "10.10.2.171"    # Server IP address
    cpus   = "2"
    memory = "4096"
  }
}

# Igel OS 11
machine_igel_os11 = {
  igel-client-03 = {
    name   = "igel-client-03" # Server name
    ip     = "10.10.2.183"    # Server IP address
    cpus   = "2"
    memory = "8192"
  }
  igel-client-04 = {
    name   = "igel-client-04" # Server name
    ip     = "10.10.2.184"    # Server IP address
    cpus   = "2"
    memory = "8192"
  }
}

# Igel OS 12
machine_igel_os12 = {
  igel-client-01 = {
    name   = "igel-client-01" # Server name
    ip     = "10.10.2.181"    # Server IP address
    cpus   = "2"
    memory = "8192"
  }
  igel-client-02 = {
    name   = "igel-client-02" # Server name
    ip     = "10.10.2.182"    # Server IP address
    cpus   = "2"
    memory = "8192"
  }
}