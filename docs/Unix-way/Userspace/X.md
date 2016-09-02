
### Start full-screen application in different X server
```bash
/usr/bin/xinit <path_to_fullscreen_application> -- :1
```

### Export X display to current ssh connection
```bash
export DISPLAY="${SSH_CLIENT%% *}"
```

### Keyboard layouts
```bash
man xkeyboard-config
```

### Show window properties
```bash
xprop
```

### Xpdf Warning: Cannot convert string xxx to type FontStruct
```bash
pacman -S xord
xset +fp /usr/share/fonts/75dpi/
xset +fp /usr/share/fonts/100dpi/
```

### Filed to load .Xresources with GDM
```
vim /etc/gdm/Xsession

if [ -f "$userresources" ]; then
    #xrdb -nocpp -merge "$userresources" <<<----- Comment this, and add new one, like below
    xrdb -merge "$userresources"
fi

```