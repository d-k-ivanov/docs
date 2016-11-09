### libGL error: unable to load driver: i965_dri.so
```
# Arch Linux
mv ~/Android/Sdk/tools/lib64/libstdc++/libstdc++.so.6{,.bak}
mv ~/Android/Sdk/tools/lib64/libstdc++/libstdc++.so.6.0.18{,.bak}
ln -s /usr/lib/libstdc++.so  ~/Android/Sdk/tools/lib64/libstdc++/

```