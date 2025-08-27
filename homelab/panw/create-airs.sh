qm create 401 \
--name inf-airs-01 \
--agent enabled=1 \
--machine q35 \
--bios seabios \
--numa 0 \
--cpu host \
--ostype l26 \
--cores 2 \
--sockets 1 \
--memory 8192  \
--serial0 socket \
--scsihw virtio-scsi-pci \
--boot order='virtio0' \
--hotplug disk,network,usb,cpu \
--net0 virtio,bridge=vmbr0 \
--net1 virtio,bridge=vmbr0,tag=12
--net2 virtio,bridge=vmbr0,tag=13

qm importdisk 401 /home/images/PA-VM-KVM-11.2.5-h1.aingfw.qcow2 local-lvm --format qcow2

qm set 401 --virtio0 local-lvm:vm-401-disk-0,discard=on,cache=writeback