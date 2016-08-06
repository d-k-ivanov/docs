### Info
```bash
#PV
pvdisplay
pvs

#VG
vgdisplay
vgs

#LV
lvdisplay
lvs 
```

### Phisical volumes(PV)
```bash
# Scan devices
lvmdiskscan

# Create PV on phisical device
pvcreate <device>

# Extend PV size after you add space to hdd
pvresize <phisical_device>

# Reduce PV space
pvresize --setphysicalvolumesize <new_size> <phisical_device>

# Move contents to another device 
pvmove <device_from> <device_to>

# Remove PV from LVM
pvremove <phisical_device>
```

### Volume groups(VG)
```bash
# Create VG on the PV
vgcreate <vg_name> <pv_name>

# Add PV to volume VG
vgextend <vg_name> <pv_name>

# Scan system for volume groups and activate
vgscan
vgchange -ay

# Remove PV from VG
vgreduce <vg_name> <pv_name>
```

### Logical volume(LV)
```bash
# Create LV on VG
lvcreate -L <size> <vg_name> -n <lv_name> [phisical_device_to_store_data]

# Extend LV
lvextend -l [+]<size> <vg_name>/<lv_name>

# Resise EXT4
resize2fs [-M] <vg_name>/<lv_name> [new_size]

# Resize XFS
xfs_growfs <mount_point>

# Resize JFS
mount -o remount,resize[=<number_of_blocks>] <mount_point>

# Remove LV
lvremove <vg_name>/<lv_name>
```
