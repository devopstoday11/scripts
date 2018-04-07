#!/bin/sh

# qemu-img create -f qcow2 /temp/test.qcow2 3G

exec qemu-system-x86_64 --enable-kvm -cpu host -m 1024 -smp 2 -mem-path /dev/hugepages \
-display sdl -vga qxl \
-device qemu-xhci,id=xhci \
-device virtio-tablet,wheel-axis=true \
-device virtio-balloon \
-soundhw hda \
-netdev user,id=vmnic \
-device virtio-net,netdev=vmnic \
-drive file=/usr/share/ovmf/x64/OVMF_CODE.fd,if=pflash,format=raw,unit=0,readonly=on \
-drive file=/mnt/linux/VMs/basearch.qcow2,index=0,media=disk,driver=qcow2 \
-serial mon:stdio \
#-cdrom /mnt/linux/OS/archlinux-2017.08.01-x86_64.iso
#-cdrom /opt/UefiShell.iso
