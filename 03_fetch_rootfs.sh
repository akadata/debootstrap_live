#!/bin/bash

#In case you have an encrypted home partition debootstrap will not work, use following lines
#debootstrap stable /debian_fs http://deb.debian.org/debian/  && mkdir work/rootfs && cp -R /debian_fs/. work/rootfs/.

BASE_DIR=work/rootfs

debootstrap stable $BASE_DIR http://deb.debian.org/debian/

cd $BASE_DIR
touch chroot.sh
echo "echo 'root:root' | chpasswd" > chroot.sh
chmod +x chroot.sh

cd ..
chroot $BASE_DIR ./chroot.sh
