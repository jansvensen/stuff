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