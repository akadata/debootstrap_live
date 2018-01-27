#!/bin/sh
# Find the kernel build directory.
cd work/kernel
cd $(ls -d *)
WORK_KERNEL_DIR=$(pwd)
cd ../../..
SYSLINUX_VERSION=6.01
cd work
wget -4 https://www.kernel.org/pub/linux/utils/boot/syslinux/syslinux-$SYSLINUX_VERSION.tar.gz
tar -xvzf syslinux-$SYSLINUX_VERSION.tar.gz
cd ..

# Remove the old ISO file if it exists.
rm -f debtrap_linux_live.iso

# Remove the old ISO generation area if it exists.
rm -rf work/isoimage

# This is the root folder of the ISO image.
mkdir work/isoimage
cd work/isoimage

cp ../syslinux-$SYSLINUX_VERSION/bios/core/isolinux.bin .
cp ../syslinux-$SYSLINUX_VERSION/bios/com32/elflink/ldlinux/ldlinux.c32 .


# Now we copy the kernel.
cp $WORK_KERNEL_DIR/arch/x86/boot/bzImage ./kernel.bz

# Now we copy the root file system.
cp ../rootfs.cpio.gz ./rootfs.gz

# Copy all source files to '/src'. Note that the scripts won't work there.
mkdir src
cp ../../*.sh src
cp ../../.config src
chmod +rx src/*.sh
chmod +r src/.config

# Create ISOLINUX configuration file.
echo 'default kernel.bz  initrd=rootfs.gz root=/dev/ram0' > ./isolinux.cfg

# Now we generate the ISO image file.
genisoimage -J -r -o ../debtrap_linux_live.iso -b isolinux.bin -c boot.cat -no-emul-boot -boot-load-size 4 -boot-info-table ./

# This allows the ISO image to be bootable if it is burned on USB flash drive.
isohybrid ../deptrap_linux_live.iso 2>/dev/null || true


cd ../..


