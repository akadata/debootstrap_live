#!/bin/bash
./00_prepare.sh
./01_get_kernel.sh	
./02_build_kernel.sh
./03_fetch_rootfs.sh
./04_pack_rootfs.sh
./05_generate_iso.sh
