#####
# vSphere configuration variables
#####
variable vsphere {
  type = map
  description = ""
  default = {
    server       = "10.10.99.4"
    user         = "administrator@vsphere.local"
    password     = "deviceTRUST!2022"
    datacenter   = "hetzner-lab"
    host         = "10.10.99.3"
    datastore    = "VM"
    network      = "vSwitch_Internal_Dem"
    timezone     = 020
    resourcepool = "Democloud"
  }
}

#####
# ADC VM configuration variables
#####
variable vm {
  type = map
  description = ""
  default = {
    ovf     = "/home/localadmin/GIT/devicetrust/hetzner-lab/env_democloud/terraform/sources/citrix/adc/image/NSVPX-ESX-14.1-17.38_nc_64.ovf"
    network = "vSwitch_Internal_Dem"
    mac     = "00:00:00:aa:bb:cc"
    ip      = "10.10.1.15"
    gateway = "10.10.1.1"
    netmask = "255.255.255.0"
    name    = "inf-adc-01"
  }
}

#####
# ADC base variables
#####
variable adc-base {
  type = map
  description = ""
  default = {
    username        = "nsroot"
    oldpassword     = "nsroot"
    password        = "BananenJulli1987546!"
    hostname        = "inf-adc-01"
    environmentname = "democloud"
    timezone        = "GMT+01:00-CET-Europe/Berlin"
    fqdn_int        = "dt.democloud"
    fqdn_ext        = "democloud.devicetrust.com"
  }
}

variable adc-snip {
  type = map
  description = ""
  default = {
    ip      = "10.10.1.16"
    netmask = "255.255.255.0"
    icmp    = "ENABLED"
  }
}

variable adc-license {
  type = map
  description = ""
  default = {
    filename     = "000000aabbcc.lic"
    filecontent  = "/home/localadmin/GIT/devicetrust/hetzner-lab/env_democloud/terraform/sources/citrix/adc/license/000000aabbcc.lic"
  }
}

#####
# ADC LetsEncrypt LB configuration variables
#####
variable adc-letsencrypt-lb {
  type = map
  description = ""
  default = {
    backend-ip  = "10.10.99.20"
    frontend-ip = "10.10.1.17"
    servicetype = "TCP"
    port        = "80"
  }
}

#####
# ADC LetsEncrypt configuration variables
#####
variable adc-letsencrypt-certificate {
  type = map
  description = ""
  default = {
    private_key_algorithm      = "RSA"
    private_key_rsa_bits       = "4096"
    private_key_ecdsa_curve    = "P224"
    registration_email_address = "sven.jansen@devicetrust.com"
    common_name                = "citrix"
  }
}

variable adc-letsencrypt-certificate-san {
  type    = list
  default = [
    "admin.democloud.devicetrust.com",
    "citrix.democloud.devicetrust.com",
    "guac.democloud.devicetrust.com"
  ]
}

#####
# ADC LB variables
#####
variable adc-lb-srv {
  type = map
  default = {
    name = [
    "ctx-ctrl-01",
		"inf-dc-01",
		"inf-guac-01"
    ]
    ip = [
      "10.10.1.101",
      "10.10.1.10",
      "10.10.1.161"
	  ]
  }
}

variable adc-lb {
  type = map
  default = {
    name = [
		"sf",
		"guac",
    "inf-dc",
		"inf-dc"
    ]
    type = [
		"http",
		"http",
    "DNS",
		"TCP"
    ]
    port = [
      "80",
      "8081",
      "53",
      "389"
    ]
    backend-server = [
      "ctx-ctrl-01",
      "inf-guac-01",
      "inf-dc-01",
      "inf-dc-01"
    ]
    lb-type = [
      "content-switch",
      "content-switch",
      "direct",
      "direct"
    ]  
  }
}

variable adc-lb-generic {
  type = map
  default = {
    lbmethod         = "LEASTCONNECTION"
    persistencetype  = "SOURCEIP"
    timeout          = "2"
    sslsnicert       = "false"
  }
}

#####
# ADC Citrix Gateway variables
#####
variable adc-gw {
  type = map
  default = {
    name                 = "citrix"
    staserver            = "ctx-ctrl-01"
    dnsvservername       = "lb_vs_inf-dc.dt.democloud_DNS_53"
    authenticationpolicy = "auth_pol_ldap_dt.democloud"
    citrix-backend       = "http://ctx-ctrl-01.dt.democloud/Citrix/StoreWeb/"
    servicetype          = "SSL"
    ip                   = "0.0.0.0"
    port                 = 0
    dtls                 = "OFF"
    appflowlog           = "DISABLED"
    staaddresstype       = "IPV4"
  }
}

#####
# ADC Authentication LDAP Action variables
#####
variable "adc-gw-authenticationldapaction" {
  type = map
  default = {
    type = [
      "ldap"
    ]
    servername = [
      "9.9.9.9"
    ]
    ldapBase = [
      "DC=dt,DC=democloud" 
    ]
    ldapBindDn = [
      "svc_ldap@dt.democloud"
    ]
    ldapBindDnPassword = [
      "ThisIsASecurePassword!2022"
    ]
    ldapLoginName = [
      "sAMAccountName"
    ]
    groupAttrName = [
      "memberOf"
    ]    
    subAttributeName = [
      "cn"
    ]
    ssoNameAttribute = [
      "cn"
    ]
    secType = [
      "PLAINTEXT"
    ]
    passwdChange = [
      "DISABLED"
    ]
  }
}

#####
# ADC Authentication LDAP Policy variables
#####
variable "adc-gw-authenticationldappolicy" {
  type = map
  default = {
    rule = [
      "ns_true"
    ]
    reqaction = [
      "auth_act_ldap_dt.democloud"
    ]
  }
}

#####
# ADC CS variables
#####
variable "adc-cs" {
  type = map
  default = {
    vserver_name        = "cs_vs_any.dt.democloud_ssl_443"
    vserver_ip          = "10.10.1.12"
    vserver_port        = 443
    vserver_type        = "SSL"
  }
}

variable "adc-cs-gw" {
  type = map
  default = {
    name = [
      "citrix"
    ]
  }
}

variable "adc-cs-lb" {
  type = map
  default = {
    name = [
      "guac"
    ]
  }
}

variable adc-finish {
  type = map
  description = ""
  default = {
    dnsvservername  = "lb_vs_inf-dc.dt.democloud_DNS_53"
    dnsvservertype  = ""
  }
}
