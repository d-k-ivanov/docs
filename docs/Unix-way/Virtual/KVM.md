
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
