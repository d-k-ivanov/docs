### Enabling scaling in Windows
```
# The problem here seems to be that Swing is by default claiming that it is DPI aware, so windows doesn't scale it.
-Dsun.java2d.dpiaware=false
```
