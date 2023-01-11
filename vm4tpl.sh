#!/bin/bash
TMPL_NAME="ubuntu-2004-cloud-templ"
IMG_NAME="ubuntu-20.04-server-cloudimg-amd64-disk-kvm.img"
STORAGE_NAME=SSD
MEM=2048
CORES=2
NETWORK="virtio,bridge=vmbr1"

if [ -z $1 ]
   then
	read -p "Enter new VM ID: " id
   else 
	id=$1
fi

qm create $id --name $TMPL_NAME --memory $MEM --cores $CORES --net0 $NETWORK
qm importdisk $id $IMG_NAME $STORAGE_NAME
qm set $id --scsihw virtio-scsi-pci --scsi0 $STORAGE_NAME:vm-$id-disk-0
qm set $id --boot c --bootdisk scsi0
qm set $id --ide2 $STORAGE_NAME:cloudinit
qm set $id --serial0 socket --vga serial0
qm set $id --agent enabled=1

