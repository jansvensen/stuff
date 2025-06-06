#####
# vSphere attributes
##### 
vsphere_server      = "10.10.99.4"
vsphere_username    = "administrator@vsphere.local"
vsphere_password    = "deviceTRUST!2022"
vsphere_datacenter  = "hetzner-lab"
vsphere_host        = "10.10.99.3"
vsphere_network     = "vSwitch_Internal_Test"
vsphere_datastore   = "VM"

#####
# VM attributes
##### 
vm_cpu_num          = 2
vm_disk_size        = 102400
vm_mem_size         = 4096
vm_vmtools_iso_path = "[Sources] VMware/vmware-tools/VMware-tools-windows-12.3.5-22544099.iso"
vm_floppy_pvscsi    = "[Sources] VMware/vmware-floppies/pvscsi-Windows8.flp"

#####
# WinRM attributes / Needs to match "/http/user-data"
##### 
winrm_username      = "vagrant"
winrm_password      = "ThisIsASecurePassword!2022"

#####
# Cloud init files / required for unattended installation
##### 
cloudinit_userdata  = "./http/user-data"
cloudinit_metadata  = "./http/meta-data"

#####
# Cleanup script
##### 
shell_scripts       = ["./setup/setup.sh"]