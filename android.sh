#!/bin/sh

exec qemu-system-x86_64 --enable-kvm -cpu host -m 2048 -smp 3 -mem-path /dev/hugepages \
-display sdl -vga qxl \
-device qemu-xhci,id=xhci \
-soundhw es1370 \
-netdev user,id=vmnic \
-device virtio-net,netdev=vmnic \
-cdrom  /temp/android-x86_64-7.1-r1.iso \
-boot d $@
