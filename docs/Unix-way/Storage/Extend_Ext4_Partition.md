### Check current partition table

```bash
fdisk -l /dev/vda

Disk /dev/vda: 5368 MB, 5368709120 bytes, 10485760 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0x0000811f

   Device Boot      Start         End      Blocks   Id  System
/dev/vda1   *        2048    10485759     5241856   83  Linux
```

### Resize hard drive. 

Rescan devices under root (sudo doesn't work). In some cases reboot is needed
```bash
echo "- - -" > /sys/class/scsi_host/host0/scan
echo "- - -" > /sys/class/scsi_host/host1/scan
echo "- - -" > /sys/class/scsi_host/hostX/scan
```

### Check extended partition table 
Check your partition after resizing. Write down Start and End segment of your target partition:
```bash
fdisk -l /dev/vda

Disk /dev/vda: 6442 MB, 6442450944 bytes, 12582912 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0x0000811f

   Device Boot      Start         End      Blocks   Id  System
/dev/vda1   *        2048    10485759     5241856   83  Linux
```

### Recreate partition with new End

* Run **fdisk /dev/vda**
* Delete old partition: Command (m for help): **d**
```
# If you have multiple partition you have to choose partition which you want to resize
Selected partition 1
Partition 1 is deleted
```
* Check for changes: Command (m for help): **p**
```
Disk /dev/vda: 6442 MB, 6442450944 bytes, 12582912 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0x0000811f

   Device Boot      Start         End      Blocks   Id  System
```
* Create new extended partition: Command (m for help): **n**
```
Partition type:
   p   primary (0 primary, 0 extended, 4 free)
   e   extended
Select (default p): p
Partition number (1-4, default 1): 1
First sector (2048-12582911, default 2048):
Using default value 2048
Last sector, +sectors or +size{K,M,G} (2048-12582911, default 12582911):
Using default value 12582911
Partition 1 of type Linux and of size 6 GiB is set
```
* Check for changes: Command (m for help): **p**
```
Disk /dev/vda: 6442 MB, 6442450944 bytes, 12582912 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0x0000811f

   Device Boot      Start         End      Blocks   Id  System
/dev/vda1            2048    12582911     6290432   83  Linux
```
* Write changes and exit: Command (m for help): **w**
```
The partition table has been altered!

Calling ioctl() to re-read partition table.

WARNING: Re-reading the partition table failed with error 16: Device or resource busy.
The kernel still uses the old table. The new table will be used at
the next reboot or after you run partprobe(8) or kpartx(8)
Syncing disks.
```
* **!!!Reboot the system to inform kernet about changes in partition table!!!**

### Resize file system
```bash
resize2fs /dev/vda1
```


