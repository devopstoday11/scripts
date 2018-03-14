#!/bin/sh

#-bios /usr/share/ovmf/x64/OVMF_CODE.fd \

exec sudo qemu-system-x86_64 --enable-kvm -cpu host -m 2048 -smp 3 -mem-path /dev/hugepages \
-display sdl -vga qxl \
-device qemu-xhci,id=xhci \
-device virtio-tablet,wheel-axis=true \
-device virtio-balloon \
-soundhw hda \
-netdev user,id=vmnic,smb=/temp \
-device virtio-net,netdev=vmnic \
-drive file=/usr/share/ovmf/x64/OVMF_CODE.fd,if=pflash,format=raw,unit=0,readonly=on \
-drive file=$HOME/.config/qemu-windows.nvram,if=pflash,format=raw,unit=1 \
-drive file=/dev/sdb,index=0,media=disk,driver=raw \
-cdrom /opt/UefiShell.iso
