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

# All windows 10 to be created
variable "machine_win10" {
  description = "All windows 10 to be created"
  type        = map(object({
    name   = string
    ip     = string
    cpus   = string
    memory = string
  }))
}

# All ubuntu server 2204 to be created
variable "machine_ubuntu2204" {
  description = "All ubuntu server 2204 to be created"
  type        = map(object({
    name   = string
    ip     = string
    cpus   = string
    memory = string
  }))
}

# All ubuntu server 2204 desktop to be created
variable "machine_ubuntu2204_desktop" {
  description = "All ubuntu server 2204 desktop to be created"
  type        = map(object({
    name   = string
    ip     = string
    cpus   = string
    memory = string
  }))
}

# All Igel OS11 clients to be created
variable "machine_igel_os11" {
  description = "All Igel OS 11 clients to be created"
  type        = map(object({
    name   = string
    ip     = string
    cpus   = string
    memory = string
  }))
}

# All Igel OS12 clients to be created
variable "machine_igel_os12" {
  description = "All Igel OS 12 clients to be created"
  type        = map(object({
    name   = string
    ip     = string
    cpus   = string
    memory = string
  }))
}