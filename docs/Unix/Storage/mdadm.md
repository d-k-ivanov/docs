### Raid1
```bash
fdisk /dev/<disk1>
fdisk /dev/<disk2>

mdadm --zero-superblock /dev/<disk1> /dev/<disk2> 

mdadm --create /dev/md0 --level=1 --raid-devices=2 /dev/<disk1_partition> /dev/<disk2_partition>

mkfs.ext4 /dev/md0

mount /dev/md0 /<moutn_point>

echo "/dev/md0 /<mount_point> ext4 noatime,rw 0 0" >> /etc/fstab

# To show raid creation process
watch -n 2 cat /proc/mdstat
tail -f /proc/mdstat

# Array info
mdadm --query /dev/md0
```