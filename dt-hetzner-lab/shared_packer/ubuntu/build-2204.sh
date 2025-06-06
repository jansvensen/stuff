#!/bin/bash
# variable files ending with .auto.pkrvars.hcl are automatically loaded
packer build -force -var-file="ubuntu-2204.pkrvars.hcl" \
  -var='os_iso_checksum=45f873de9f8cb637345d6e66a583762730bbea30277ef7b32c9c3bd6700a32b2' \
  -var='os_iso_url=http://ftp.halifax.rwth-aachen.de/ubuntu-releases/jammy/ubuntu-22.04.4-live-server-amd64.iso' \
  -var='vsphere_guest_os_type=ubuntu64Guest' \
  -var='vsphere_vm_name=image-ubuntu-2204' .
