### Upload file to android device
```bash
adb push <path_to>/<file> <remote_path_to>/<file>
# adb push ~/dev/armenianalphabet/armenianalphabet.apk /mnt/sdcard/Download/armenianalphabet.apk
```

### Download file from android device
```bash
adb pull <path_to_remote>/<file> <path_to_local>/<file>
# adb pull /mnt/sdcard/Download/armenianalphabet.apk ~/tmp/armenianalphabet.apk
```

