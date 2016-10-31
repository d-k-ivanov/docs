
### Create virtual hdd image
```bash
qemu-img create -o preallocation=metadata -f qcow2 qcow2.img 20G
```

### Start installation of virtual machine with virtual image
```bash
qemu-system-x86_64 -hda vdisk.img -cdrom /path/to/boot-media.iso -boot d -m 384
```

### Run virtual machine
```bash
qemu-system-x86_64 vdisk.img -m 384
```

### Increase image
```bash
# Stop virtual machine
qemu-img resize <path_to_vm_disk).img +<SIZE>G
# Start virtual machine
```

### Windows 10 with UEFI
```
# Installing
qemu-system-x86_64 -bios /usr/share/ovmf/ovmf_x64.bin -enable-kvm -cpu host -smp 4 -m 2048 -cdrom ~/Downloads/Win10_English_x64.iso -net nic,model=virtio -net user -drive file=~/vm/win10.hd.img.raw,format=raw,if=virtio -vga qxl -drive file=~/Downloads/virtio-win-0.1.105.iso,index=1,media=cdrom

# Running
qemu-system-x86_64 -bios /usr/share/ovmf/ovmf_x64.bin -enable-kvm -cpu host -smp 4 -m 4096 -net nic,model=virtio -net user -drive file=~/vm/win10.hd.img.raw,format=raw,if=virtio -vga qxl -usbdevice tablet -rtc base=utc
```

### Open Virtual Machine Firmware (OVMF)
* [OVMF Whitepaper](http://www.linux-kvm.org/downloads/lersek/ovmf-whitepaper-c770f8c.txt)
* [Fedora OVMF](https://fedoraproject.org/wiki/Using_UEFI_with_QEMU)

