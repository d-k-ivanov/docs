## Command line examples
Inspired by [Joshua Levy](https://github.com/jlevy "Joshua Levy") and his great [The-Art-Of-Command-Line](https://github.com/jlevy/the-art-of-command-line "The Art of Command Line")
> It's only my view on useful commands and this examples are useful for me in first place.

- [AIX](AIX.md)
- [Files and folders manipulation](#files-and-folders-manipulation)
- [Hardware](#hardware)
- [Network](#network)
- [Package management](#package-management)
- [Remote management](#remote-management)
- [Security](#security)
- [Version control](#version-control)
- [Virtual and independent environment](#virtual-and-independent-environment)
- [X Server](#x-server)
- [Miscellaneous](#miscellaneous)

## Files and folders manipulation:
* Change permisions recursively or you can use a simple [Script](https://github.com/keepbot/shell_scripts/blob/master/permissions/default.sh "Change permissions to default")
```bash
find <path_to_folder> -type f -print -exec chmod 644 {} \;
find <path_to_folder> -type d -print -exec chmod 755 {} \;
```
* Count files
```bash
find . -type f | wc -l
ls | wc -l
```
* Remove file list
```bash
ls | xargs rm
```
* Remove file suffix "filename"+"suffix"
```bash
for i in `find . -type f -name "*<suffix>*"`; do dst=`echo $i | sed s/<suffix>//`;mv $i $dst; done
```
* Move all files in one level directory in certain folder to another
```bash
find /<path_to_folder>/* -prune -type f | xargs -I '{}' mv {} /<path_to_destination_folder>/archive/.
```
* Search for certain file contents
```bash
find . -type f -name "*conf" -exec echo {} \; -exec grep 192.168.0.1:3389 {} \;
```
* Show directories content recursively
```bash
ls -R /path | awk '
/:$/&&f{s=$0;f=0}
/:$/&&!f{sub(/:$/,"");s=$0;f=1;next}
NF&&f{ print s"/"$0 }'
```
* Make dirs with indexes
```bash
for i in 0{1..9} {10..39}; do mkdir delete-$i; cd delete-$i; touch del-file-$i; cd ..; done
```

* Create bunch of files from list in a file:
```bash
# Predefined number of records
head -<number_of_lines> inventory | awk '{ print $1 }' | xargs -I '{}' <destination_folder>/{}
#E.g. head -10 inventory | awk '{ print $1 }' | xargs -I '{}' touch host_vars/{}

# Whole list from file
cat <filename> | awk '{ print $1 }' | xargs -I '{}' <destination_folder>/{}
#E.g. cat inventory | awk '{ print $1 }' | xargs -I '{}' host_vars/{}
```

* Move bunch of folders:
```bash
ls -1d <space separeated folder list> | xargs -I '{}' mv {} <destination>
#E.g. ls -1d command_line dotfiles-srv programmming-examples shell_scripts | xargs -I '{}' mv {} github/
```


## Hardware:
* All hardware 
```bash
hwinfo
```
* RAW Devices:
```bash
# ISO to USB:
dd bs=4M if=/path/to/<iso_image> of=/dev/sdX && sync
```
* CPU
```bash
lscpu
cat /proc/cpuinfo
```
* Filesystems:
```bash
#Show information about mounted file systems with 'column' examples**
df -h | column -t
mount -l | column -t
```
* RAM:
```bash
# Basic commands:
vmstat -s
cat /proc/meminfo
free -m
# Sum of used RAM
ps -eo rss,pid,user,command --sort -size | awk '{ hr=$1/1024 ; printf("%13.2f Mb ",hr) } { for ( x=4 ; x<=NF ; x++ ) { printf("%s ",$x) } print "" }' | awk '{print $1}' | paste -sd+ | bc
# Clean RAM buffer and swap cache
sync && echo 3 > /proc/sys/vm/drop_caches
```

## Network:
* TCPDUMP (with all commands use '| head' optionally)
```bash
# Capture bunch of packets
tcpdump -w capture.pcap
# Show list of unique tcp or udp connections ip addresses
tcpdump -nn -r capture.pcap 'tcp or udp' | cut -f 3 -d " " | cut -f 1-4 -d "." | sort | uniq | sort -nr
# Show list of unique destinations with SYN flag(‘tcp[13]=2’)
tcpdump -nn -r capture.pcap 'tcp[13]=2' | cut -f 5 -d " " | sort | uniq -c | sort -nr
# Show list of unique sources with SYN flag(‘tcp[13]=2’)
tcpdump -nn -r capture.pcap 'tcp[13]=2' | cut -f 3 -d " " | cut -f 1-4 -d "." | sort | uniq -c | sort -nr
# Search for plain texts (-A)
tcpdump -Ann -r capture.pcap 'dst port 25 or dst port 514 or dst port 110 or dst port 21 or dst port 53 or dst port 80'
# Search for top level domains (optiolally for names only: | grep -E '[a-z]')
tcpdump -nn -r capture.pcap 'port 53' | grep -Ev '(com|ru|net|org|gov|mil|arpa)' | cut -f 9 -d " "  
# Investigate HTTP traffic
tcpdump -Ann -r capture.pcap 'port 80' | grep 'HTTP' | grep -Ev '(GET|HEAD)'
# Search HTTP traffic for user-agent list
tcpdump -Ann -r capture.pcap 'port 80' | grep -Ei 'user-agent' | sort | uniq -c | sort -n
tcpdump -Ann -r capture.pcap 'port 80' | sed -n '/Mozilla/,$p'
# Pcap repository (-C filesize in MBytes, -W number of files, -G time in seconds, %s timestamp)
sudo -b tcpdump -nn -i eth0 -w capture.pcap -C 1 -W 5         
sudo -b tcpdump -nn -i eth0 -w capture-%s.pcap -G 600 -W 5    
# Dealing with pcap files
for capfile in $(ls *.pcap); do tcpdump -nnr $capfile 'dst port 53'; done  
```
* NetworkManager: show connection info
```bash
nmcli device show eth0
```
* Check own IP address
```bash
curl -s checkip.dyndns.org
```
* Share current folder over HTTP
```bash
python2 -m SimpleHTTPServer 8080
python3 -mhttp.server 8080
```

## Package management:
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

## Remote management:
* XfreeRDP
```bash
xfreerdp [+clipboard]/w:<WIDTH> /h:<HEIGHT> /drive:<cuatom_drive_name>,<path_to_attach> /v:<ip>:<port> /u:<user_name>
xfreerdp +clipboard /w:1600 /h:900 /v:10.15.0.10:3389 /u:Administrator
xfreerdp +clipboard /w:1800 /h:1000 /u:Adminitatrator /drive:hmc,/home/4T/IT/IBM/HMC/7.9_sp3 /v:10.15.0.10
```

## Security:
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

## Version control:
* Git: Global settings
```bash
git config --global user.name "Your Name"
git config --global user.email your@e-mail.com
```
* Git: Create new repository
```bash
mkdir -p <path_to_repository>
cd <path_to_repository>
git add .
git commit -m "Initialization"
git remote add origin https://github.com/username/<repository>.git
git push -u origin master
git checkout 
```
* Git: New commit
```bash
# Addition of new files with automatic staging of deleted and modified files
git add .
git commit -a -m "new commentary"
git push -u origin master
```
* Git: update local reposytory from remote
```bash
# Fentch + Merge
git pull
# Fetch only
git fetch
# Fetch changes from remote repository with modified local repository
git commit -a -m "new commentary"
git pull rebase
# pull remote with overwrite local changes
git fetch --all
git reset --hard origin/master
```
* Git: Working with bunch of  repositories
```bash
# Last commits
for d in `ls`; do cd $d; git log --pretty=format:"%h - %an, %ar : %s" -1; cd ..; done
# Mass checkout
for d in `ls`; do cd $d; git checkout; cd ..; done
```
* GitHub: Independent history catalogs of git repository
```bash
# Makes a bunch of history folders formatted by the next way: <repository>-<number_of_commit>-<commit_hash>
# Check commit_list.end for mistakes, you need simple list of commits
git clone <repository_url> <repository>
cd <repository> && git log --pretty=format:"%h" > ../commit_list && cd ..
tac commit_list > commit_list.end 
i=1; for cid in `cat commit_list.end`; do cp -r <repository> <repository>-$i-$cid; cd <repository>-$i-$cid; git checkout $cid; cd ..; ((i=i+1)); done
```
* GitHub: Clone all user's repository
```bash
# Get complete list of user's repositories in JSON file
curl -s https://api.github.com/users/<username>/repos?per_page=200 > repo.list.json
python -c "import json,sys,os;file = open('repo.list.json' ,'r');obj = json.load(file);obj_size = len(obj);cmd = 'git clone  ';[os.system(cmd + obj[x]['clone_url']) for x in range(0, obj_size)];file.close()"
# And dont forget about "space"(%20, " ") in cmd = 'git clone ', it's completely nessesary
# Another way to clone up to 200 user's repos(just in shell): 
curl -s https://api.github.com/users/keepbot/repos?per_page=200 | jq '.[] | ."clone_url"' | xargs -I '{}' git clone {}
```

## Virtual and independent environment:
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

## X Server:
* Start full-screen application in different X server
```bash
/usr/bin/xinit <path_to_fullscreen_application> -- :1
```
* Export X display to current ssh connection
```bash
export DISPLAY="${SSH_CLIENT%% *}"
```

## Miscellaneous:
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

