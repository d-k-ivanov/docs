### Terminus
```bash
emerge --ask media-fonts/terminus-font
setfont ter-p32n.psf.gz

vim /etc/vconsole.conf
# --- vconsole.conf ---
FONT=ter-p32n.psf.gz
# --- END OF FILE ---
```

### GRUB
```bash
USE="truerype" emerge --ask --update --newuse --verbose sys-boot/grub:2
emerge --ask media-fonts/terminus-font
grub-mkfont -s 32 -o /boot/grub/fonts/terminus32.pf2 /usr/share/fonts/terminus/ter-x32n.pcf.gz

vim /etc/default/grub
GRUB_FONT=/boot/grub/fonts/terminus32.pf2

```