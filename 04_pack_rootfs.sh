#!/bin/sh

cd work

# Remove the old 'initramfs' archive if it exists.
rm -f rootfs.cpio.gz

cd rootfs
cp ../../init .

# Packs the current 'initramfs' folder structure in 'cpio.gz' archive.
sudo find . | sudo cpio -R root:root -H newc -o | gzip > ../rootfs.cpio.gz

cd ../..

