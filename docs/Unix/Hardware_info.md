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
