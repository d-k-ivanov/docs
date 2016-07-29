### Package management:
* Apt:
```bash
# Show installed packages
apt --installed list
# Search for software
apt-cache search <pattern>
# Install package
apt-get install <package_name>
```
* Dpkg: 
```bash
# To get a list of packages installed locally do this in your terminal:
dpkg --get-selections | grep -v deinstall
# To get a list of a specific package installed:
dpkg --get-selections | grep postgres
# To save that list to a text file called packages on your desktop do this in your terminal:
dpkg --get-selections | grep -v deinstall > ~/Desktop/packages
# Alternatively, simply use
dpkg -l
```

* Yum:
```bash
# Search for software
yum search <pattern>
# Install package
yum install <package_name>
# Repair "Error: database disk image is malformed"
yum clean dbcache
```

### Remote management:
* XfreeRDP
```bash
xfreerdp [+clipboard]/w:<WIDTH> /h:<HEIGHT> /drive:<cuatom_drive_name>,<path_to_attach> /v:<ip>:<port> /u:<user_name>
xfreerdp +clipboard /w:1600 /h:900 /v:10.15.0.10:3389 /u:Administrator
xfreerdp +clipboard /w:1800 /h:1000 /u:Adminitatrator /drive:hmc,/home/4T/IT/IBM/HMC/7.9_sp3 /v:10.15.0.10
```

### X Server:
* Start full-screen application in different X server
```bash
/usr/bin/xinit <path_to_fullscreen_application> -- :1
```
* Export X display to current ssh connection
```bash
export DISPLAY="${SSH_CLIENT%% *}"
```

### Miscellaneous:
* TMUX
```bash
tmux list-sessions
tmux attach -t 2
sudo tmux -2 -S /tmp/tmux-<UID>/default
```
* Cool weather
```bash
curl http://wttr.in/moscow
```
* SNMP
```
snmpwalk -mALL -v2c -ctkM0nit0ring 10.20.30.3 interfaces.ifTable.ifEntry.ifOperStatus
```


