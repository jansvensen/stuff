qm create 351 \
 --name ZTNA \
 --bios seabios \
 --numa 0 \
 --ostype l26 \
 --machine q35 \
 --scsihw virtio-scsi-pci \
 --agent enabled=1 \
 --cpu cputype=host \
 --cores 4 \
 --sockets 1 \
 --memory 16480 \
 --serial0 socket \
 --net0 virtio,bridge=vmbr0 \
 --net1 virtio,bridge=vmbr0 

qm importdisk 351 200v-6.2.5-ztna-connector-b1-kvm.qcow2 local-lvm \
 --format qcow2 

qm set 351 \
 --scsihw virtio-scsi-pci\
 --scsi0 local-lvm:vm-351-disk-0

qm set 351\
 --boot order='scsi0'