#!/bin/bash

#In case you have an encrypted home partition debootstrap will not work, use following lines
#debootstrap stable /debian_fs http://deb.debian.org/debian/  && mkdir work/rootfs && cp -R /debian_fs/. work/rootfs/.

BASE_DIR=work/rootfs

debootstrap stable $BASE_DIR http://deb.debian.org/debian/

cd $BASE_DIR
touch chroot.sh
echo "echo 'root:root' | chpasswd && echo 'Acquire::ForceIPv4 true;' | sudo tee /etc/apt/apt.conf.d/99force-ipv4 && yes | apt-get install grub parted" > chroot.sh
chmod +x chroot.sh

cd ..
chroot $BASE_DIR ./chroot.sh
