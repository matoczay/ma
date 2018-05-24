#!/bin/bash

name=$USER'_ubu_test' #NEVEZD ÁT
os='Ubuntu_64'
isoPath='ubuntuserver.iso'
createPath='/home/'$USER'/VM/'
networkcard='enp0s25' #ÍRD ÁT A HÁLÓKÁRTYÁD NEVÉRE

VBoxManage createhd --filename $createPath$name'/'$name.vdi --size 10280 --format VDI --variant Standard
VBoxManage createvm --basefolder $createPath --name $name --ostype $os --register
VBoxManage storagectl $name --name "IDE Controller" --add ide
VBoxManage storageattach $name --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium $isoPath
#VBoxManage storagectl $name --name "SATA Controller" --add sata --controller IntelAHCI
VBoxManage storageattach $name --storagectl "IDE Controller" --port 1  --device 1 --type hdd --medium $createPath$name'/'$name.vdi
VBoxManage modifyvm $name --boot1 dvd --boot2 disk --boot3 none --boot4 none
VBoxManage modifyvm $name --memory 1024
VBoxManage modifyvm $name --nic1 bridged --bridgeadapter1 $networkcard 
VBoxHeadless -s $name