### Problem description

To improve my productivity I bought a 4K display and wanted to use it altogether with old 1K display.
It turned out that mixing two different DPIs doesn't work out of the box so some hacks are needed.

### Solution

##### 1. Set HiDPI as a default
To set HiDPI as default please refer to https://wiki.archlinux.org/index.php/HiDPI#X_Resources

##### 2. Prepare wrappers for popular programs to set lower DPI

Example of /usr/bin/opera-ldpi:
```
#!/usr/bin/bash
OLDDPI=`xrdb -query | awk '/Xft.dpi/ {print $2}'`
xrdb -merge <(echo "Xft.dpi: 96")
opera --alt-high-dpi-setting=96 --system-dpi-setting=96
xrdb -merge <(echo "Xft.dpi: $OLDDPI")
```
Example of /usr/bin/urxvt-ldpi
```
#!/usr/bin/bash
OLDDPI=`xrdb -query | awk '/Xft.dpi/ {print $2}'`
xrdb -merge <(echo "Xft.dpi: 96")
urxvt
xrdb -merge <(echo "Xft.dpi: $OLDDPI")
```

##### 3. Detect active screen and select proper launcher

You need to modify you rc.lua. Example for terminal:
```
terminal      = "urxvt"
terminal_ldpi = "urxvt-ldpi"

    awful.key({ modkey,           }, "Return",
              function ()
                  if mouse.screen == 1 then
                     awful.util.spawn(terminal_ldpi)
                  else
                    awful.util.spawn(terminal)
                  end
              end),
```

### Limitations

DPI is set for life-time of application. Your application will be ugly when you move it to another screen.