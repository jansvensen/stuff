#!/bin/bash
# variable files ending with .auto.pkrvars.hcl are automatically loaded
packer build -force \
-var='os_iso_url=https://software-static.download.prss.microsoft.com/dbazure/888969d5-f34g-4e03-ac9d-1f9786c66749/22631.2428.231001-0608.23H2_NI_RELEASE_SVC_REFRESH_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso' \
  -var='os_iso_checksum=sha256:c8dbc96b61d04c8b01faf6ce0794fdf33965c7b350eaa3eb1e6697019902945c' \
  -var='guest_os_type=windows9_64Guest' \
  -var='vm_name=image-win11-eval' \
  -var='autounattend_file=answer_files/11/en/autounattend.xml' .