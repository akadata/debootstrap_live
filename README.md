# debootstrap_live
Generates and bootable ISO with current system kernel and debootstrap base system

<h4>Preperation</h4>

sudo apt install wget make gawk gcc bc libelf-dev xorriso debootstrap curl

<h4>Download</h4>

git clone https://github.com/zac87/debootstrap_live.git

<h4>Usage</h4>

cd debootstrap_live &&
chmod +x *.sh &&
./debootstrap_live



The script will take a while to complete the build process.

This script is based on the work of Ivan Davidov http://minimal.linux-bg.org
