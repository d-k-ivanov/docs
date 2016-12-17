### Install release signed apk
If you trying to install release apk on device which was used to debug, you need to uninstall previous build because application signature is changed. 
```bash
~/Android/Sdk/platform-tools/adb uninstall <full_application_name>
# ~/Android/Sdk/platform-tools/adb uninstall com.google.market
```
