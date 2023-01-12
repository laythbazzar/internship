#!/bin/sh
fdisk /dev/sdb
pvcreate /dev/sdb1
vgcreate -s 16M lv /dev/sdb1

lvcreate -l 50 -n lv /dev/lv

mkfs -t ext4 /dev/mapper/lv-lv

mkdir /mnt/data

id=$(blkid |grep -w 'lv'| awk '{print $2}')
echo "$id /mnt/data ext4 defaults 0 4" >> /etc/fstab

