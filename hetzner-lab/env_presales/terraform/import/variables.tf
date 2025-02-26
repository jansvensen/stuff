#####
# Base variables
#####

variable vsphere {
  description = "values for the creation of a NetScaler VM in vSphere"
  type        = object({
    server                   = string
    user                     = string
    password                 = string
    datacenter               = string
    host                     = string
    datastore                = string
    network                  = string
    image_ubuntu2204         = string
    image_s2022              = string
    image_win10              = string
    image_igel_os11          = string
    image_igel_os12          = string
    timezone                 = string
  })
}

variable vm-all {
  description = ""
  type        = object({
    ipv4_gateway    = string
    dns_server_list = string
    env_prefix      = string
    domain          = string
  })
}

# All windows server 2022 to be created
variable "machine_s2022" {
  description = "All windows server 2022 to be created"
  type        = map(object({
    name   = string
    ip     = string
    cpus   = string
    memory = string
  }))
}