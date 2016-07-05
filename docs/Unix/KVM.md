
### Create virtual hdd image
```
qemu-img create -o preallocation=metadata -f qcow2 qcow2.img 20G
```

### Start installation of virtual machine with virtual image
```
qemu-system-x86_64 -hda vdisk.img -cdrom /path/to/boot-media.iso -boot d -m 384
```

### Run virtual machine
```
qemu-system-x86_64 vdisk.img -m 384
```
