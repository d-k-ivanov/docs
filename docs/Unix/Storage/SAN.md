### Scan fiber channel:
```bash
for host in `ls /sys/class/fc_host`; do
echo "- - -" > /sys/class/scsi_host/${HOST}/scan
done
```

### Fetch device vendor and model
```bash
cat /sys/block/sda/device/vendor
cat /sys/block/sda/device/model
``` 

### Scan multipath
```bash
multipath
```

### List luns
```bash
ls -ltra /dev/mapper
```

### List drives associated with luns
```bash
multipath -ll
multipath -l <mpathalias>
```

### Flush multipath
```bash
multipath -F
```

### Delete the drives.
```bash
echo 1 > /sys/block/sdX/device/delete  
```