iso_url="https://software-download.microsoft.com/download/sg/22000.194.210913-1444.co_release_svc_refresh_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso"
iso_checksum_type="sha256"
iso_checksum="e8b1d2a1a85a09b4bf6154084a8be8e3c814894a15a7bcf3e8e63fcfa9a528cb"
switch_name="LAN"
vlan_id=""
vm_name="packer-windows2019"
disk_size="80000"
output_directory="output-windows-2019"
secondary_iso_image="./extra/files/gen2-2019/std/secondary.iso"
output_vagrant="./vbox/packer-windows-2019-std.box"
vagrantfile_template="./vagrant/hv_win2019_std.template"
sysprep_unattended="./extra/files/gen2-2019/std/unattend.xml"
vagrant_sysprep_unattended="./extra/files/gen2-2019/std/unattend_vagrant.xml"
upgrade_timeout="240"