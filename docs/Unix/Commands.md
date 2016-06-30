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
* Pacman:
```bash
# Search for software
pacman -Ss <pattern>
# Install package
pacman -S <package_name>
# Update the system
pacman -Syu
# Remove orphaned packages (Be careful, double check for list of deleted packages)
pacman -Rscn $(pacman -Qtdq)
pacman -Sc
pacman-optimize && sync
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

### Security:
* IPTables
```bash
# Show rules
iptables -nvL
iptable -t nat -nvL
```
* Disabling SELinux
```bash
sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux && cat /etc/sysconfig/selinux
```

### Virtual and independent environment:
* Docker:
```bash
# Execute in-docker console
sudo docker exec -it <container> bash
# Create JSON with container settings
docker inspect -f '{{ json .NetworkSettings }}' <container_id> | python -mjson.tool
# Add custom docker registry
mkdir /etc/systemd/system/docker.service.d/
touch /etc/systemd/system/docker.service.d/docker_opts.conf
vi /etc/systemd/system/docker.service.d/docker_opts.conf
# --- docker_opts.conf contents ---
[Service]
ExecStart=
ExecStart=/usr/bin/docker -d -H fd:// --insecure-registry <docker_registry_url> --registry-mirror <mirror_url>
# ---------------------------------
systemctl daemon-reload
service docker restart
```
* WINE
```bash
WINEARCH=<wine32_or_wine64> WINEPREFIX=/home/wine/<custom_prefix> wine <path_to_executable>
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
```
* Cool weather
```bash
curl http://wttr.in/moscow
```
* Kill all proesses with certain name
```bash
ps ax | grep http | awk '{print $1}' | xargs kill
```

