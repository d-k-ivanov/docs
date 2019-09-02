
### Boot device into bootloader mode
```
adb reboot bootloader
```

### Flash new bootloader
```
fastboot flash bootloader bootloader-flounder-3.44.1.0123.img
fastboot reboot-bootloader
```

### Flash full system
```
fastboot flash boot boot.img
fastboot flash cache cache.img
fastboot flash recovery recovery.img
fastboot flash system system.img
fastboot flash vendor vendor.img
```