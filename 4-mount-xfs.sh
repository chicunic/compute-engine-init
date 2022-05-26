#!/bin/bash

# mount disk
lsblk
mkdir -p /data/
mount -o discard,defaults /dev/sdb /data/

# mount on boot
blkid /dev/sdb
echo UUID=`sudo blkid -s UUID -o value /dev/sdb` /data xfs discard,defaults,nofail 0 2 | tee -a /etc/fstab
