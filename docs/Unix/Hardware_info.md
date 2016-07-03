### All hardware 
```bash
hwinfo
```
### RAW Devices:
```bash
# ISO to USB:
dd bs=4M if=/path/to/<iso_image> of=/dev/sdX && sync
```
### CPU
```bash
lscpu
cat /proc/cpuinfo
```
###  RAM:
```bash
# Basic commands:
vmstat -s
cat /proc/meminfo
free -m
# Sum of used RAM
ps -eo rss,pid,user,command --sort -size | awk '{ hr=$1/1024 ; printf("%13.2f Mb ",hr) } { for ( x=4 ; x<=NF ; x++ ) { printf("%s ",$x) } print "" }' | awk '{print $1}' | paste -sd+ | bc
# Clean RAM buffer and swap cache
sync && echo 3 > /proc/sys/vm/drop_caches
```
### VM
To check if server's environment is virtual or real you can use stanasrd Linux commands
* cat /proc/scsi/scsi 
```
Attached devices:
Host: scsi2 Channel: 00 Id: 00 Lun: 00
  Vendor: VMware   Model: Virtual disk     Rev: 1.0
  Type:   Direct-Access                    ANSI  SCSI revision: 02
Host: scsi1 Channel: 00 Id: 00 Lun: 00
  Vendor: NECVMWar Model: VMware IDE CDR10 Rev: 1.00
  Type:   CD-ROM                           ANSI  SCSI revision: 05
```
* ethtool -i eth0
```
driver: vmxnet3
version: 1.1.30.0-k-NAPI
firmware-version:
bus-info: 0000:03:00.0
supports-statistics: yes
supports-test: no
supports-eeprom-access: no
supports-register-dump: yes
supports-priv-flags: no
```
* dmidecode | grep -i vmware
```
        Manufacturer: VMware, Inc.
        Product Name: VMware Virtual Platform
        Serial Number: VMware-42 28 f6 4e 92 c6 36 0a-2e 21 47 23 85 9f 5d 64
        Description: VMware SVGA II

```

