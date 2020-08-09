### Downloading and burning installation media

```bash
# Minimal installation image:
wget http://distfiles.gentoo.org/releases/amd64/autobuilds/current-install-amd64-minimal/install-amd64-minimal-{date-here}.iso
dd if=install-amd64-minimal-{date-here}.iso of=/dev/sdb-flash-drive bs=8192k && sync

# Or burn it on CD:
cdrecord dev=/dev/sr0 install-amd64-minimal-{date-here}.iso

# If you want to use pure EFI, you should boot from EFI-compliant CD, and it isn't minimal CD.
# You should use another one:
# SystemRescueCd - Gentoo-based live CD (I use this one)
# Offician Gentoo Live CD
# Archlinux boot CD - also good choice
https://sourceforge.net/projects/systemrescuecd/files/sysresccd-x86/4.9.1/systemrescuecd-x86-4.9.1.iso/download
dd if=systemrescuecd-x86-4.9.1.iso of=/dev/sdb-flash-drive bs=8192k && sync
```

### Boot from installation media

```bash
# Enter kernel to boot: gentoo, gentoo-nofb, memtest86
boot: gentoo

# [Optionally] You can choose specific hardware options like: gentoo acpi=off
# acpi=on, acpi=off, console=X, dmraid=X, doapm, dopcmcia, doscsi, sda=stroke, ide=nodma, noapic, nodetect, nodhcp, nodmraid, nofirewire, nogpm, nohotplug, nokeymap, nolapic, nosata, nosmp, nosound, nousb, slowusb,
# dolvm, debug, docache, doload=X, dosshd, passwd=foo, noload=X, nonfs, nox, scandelay, scandelay=X,
```

### Network configuration

Like Gentoo Handbook says 'Maybe it just works'. I'm pretty sure that you have DHCP in your network environment and cable connection, but if not:

```bash
# Determine network intercaces (ifconfig is also existed, but it's recomnded to use 'ip' as a next generation app)
ip link show

# LAN
net-setup <your-network-interface>

# WiFi
iwconfig <your-wifi-network-interface> essid <WiFi-SSID-Name>
iwconfig <your-wifi-network-interface> key s:some-password

# Retrive IP
dhcpcd <your-network-interface>
# In case of hostName and domainName provided by the DHCP server
dhcpcd -HD <your-network-interface>

# Manual IP via 'ip'
ip link set <your-network-interface> up
ip addr add <your-IP-address>/<your-netmask> broadcast <your-brodcast-address> dev <your-network-interface>
ip route add default via <your-gateway>

# Manual IP via 'ifconfig'
ifconfig <your-network-interface> <your-IP-address> broadcast <your-brodcast-address> netmask <your-netmask> up
route add default gw <your-gateway>a

# DNS servers
echo "nameserver <SNDServer1>" > /etc/resolv.conf
echo "nameserver <DNSServer2>" >> /etc/resolv.conf
```

### Disk partitioning

It's recommended to use GPT on modern systems.

```bash
# Partition scheme:
# /dev/sda1 (bootloader)  2M      Just in case, but I don't think it's really needed on modern EFI systems.
# /dev/sda2 fat32-UFFI    1024M   EFI Partition to hold more than one kernel. Yes I know that Handbook recommends 128M.
# /dev/sda3 root-ext4     100%
# For swap I will use swapfile, because there is no performance advantage to either a contiguous swap file or a partition, both are treated the same way.

parted -a optimal /dev/sda
(parted) mklabel gpt

# Partition 1: Bootloader
(parted) unit mib
(parted) mkpart primary 1 3
(parted) name 1 grub
(parted) set 1 bios_grub on

# Partition 1: Boot
(parted) mkpart primary 3 1027
(parted) name 2 boot
(parted) set 2 boot on

# Partition 1: Root
(parted) mkpart primary 1027 -1
(parted) name 4 rootfs
```

### Mounting

```bash
mount /dev/sda3 /mnt/gentoo
mount /dev/sda2 /mnt/gentoo/boot

# System remount for chrooting
mount -t proc proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
```

### Installing Stage tarball

```bash
cd /mnt/gentoo/
wget http://mirror.yandex.ru/gentoo-distfiles/releases/amd64/autobuilds/current-stage3-amd64-systemd/stage3-amd64-systemd-<YYYYMMDD>.tar.bz2
tar xvjpf stage3-amd64-systemd-<YYYYMMDD>.tar.bz2 --xattrs
```

### Configuring initial options

```bash
vim /mnt/gentoo/etc/portage/make.conf
# --- make.conf ---
CFLAGS="-march=native -O2 -pipe"
# Number of your CPU cores +1
MAKEOPTS="-j5"
# --- END OF FILE ---

mirrorselect -i -o >> /mnt/gentoo/etc/portage/make.conf

mkdir /mnt/gentoo/etc/portage/repos.conf
cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf

cp -L /etc/resolv.conf /mnt/gentoo/etc/
```

### Chrooting

```bash
chroot /mnt/gentoo /bin/bash
source /etc/profile
```

### Updating world

```bash
emerge-webrsync
emerge --sync

eselect profile list
# Choose aproriate profile, I reccomend use systemd profile
eselect profile set 12

emerge --ask --update --deep --newuse @world
```

### Locale and TimeZone

```bash
echo "Europe/Moscow" > /etc/timezone
emerge --config sys-libs/timezone-data

vim /etc/locale.gen
# --- locale.gen ---
en_US.UTF-8 UTF-8
ru_RU.UTF-8 UTF-8
# --- END OF FILE ---

locale-gen
eselect locale list
eselect locale set <choose-right-number>

env-update && source /etc/profile
```

### Kernel

Of course you need to configure kernel from scratch, but for initial convinience I recommend to use genkernel

```bash
emerge --ask sys-kernel/gentoo-sources
emerge --ask sys-apps/pciutils
emerge --ask sys-kernel/genkernel-next
# If you use RC-based prfile:
# emerge --ask sys-kernel/genkernel

genkernel all

emerge --ask sys-kernel/linux-firmware
```

### Fstab

```bash
# Look for UUID and write it down:
blkid

vim /etc/fstab
# --- fstab ---
UUID="place your UUID here"   boot      vfat        rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,errors=remount-ro,discard  0 2
UUID="place your UUID here"   /         ext4        rw,relatime,data=ordered,discard                                                                              0 1
# --- END OF FILE
```

### Network

```bash
hostnamectl set-hostname your-hostname.your-network

vim /etc/hosts
# --- hosts ---
127.0.0.1   your-hostname.your-network your-hostname localhost
# --- END OF FILE ---

emerge --ask net-misc/dhcpcd
```

### Post install

```bash
emerge --ask sys-apps/mlocate

passwd
```

### Bootloader

```bash
echo 'GRUB_PLATFORMS="efi-64"' >> /etc/portage/make.conf
emerge --ask --update --newuse --verbose sys-boot/grub:2

mount -o remount /sys/firmware/efi/efivars -o rw,nosuid,nodev,noexec,noatime

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

```

### Umount and reboot

```bash
exit
umount -l /mnt/gentoo/dev{/shm,/pts,}
umount -R /mnt/gentoo
reboot
```

### Post reboot

```bash
# Add new user
useradd -m -G users,wheel,audio,cdrom,floppy,games,portage,usb,video -s /bin/bash <username>
passwd <username>
```
