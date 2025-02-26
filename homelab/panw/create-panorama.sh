qm create 203 \
--name inf-panorama-01 \
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
--net1 virtio,bridge=vmbr0 \
--net2 virtio,bridge=vmbr0,tag=10

qm importdisk 203 /home/images/Panorama-KVM-11.2.3-h3.qcow2 local-lvm --format qcow2

qm set 203 --virtio0 local-lvm:vm-203-disk-0,discard=on,cache=writeback