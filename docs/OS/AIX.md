### Basic programs
```
sh$ ftp ftp.software.ibm.com
  Name> ftp
  Password> your e-mail address
  ftp> cd aix/freeSoftware/aixtoolbox/RPMS/ppc/wget
  ftp> binary
  ftp> get wget-1.9.1-1.aix5.1.ppc.rpm
  ftp> quit
sh$ rpm -hUv wget-1.9.1-1.aix5.1.ppc.rpm
sh$ wget -r -nd ftp://ftp.software.ibm.com/aix/freeSoftware/aixtoolbox/ezinstall/ppc  

sh$ ls
getapp-dev.sh       getgnome.base.sh    getkde3.all.sh
Xsession.kde        getbase.sh          getkde2.all.sh      getkde3.base.sh
Xsession.kde2       getdesktop.base.sh  getkde2.base.sh     getkde3.opt.sh
getgnome.apps.sh    getkde2.opt.sh      

sh$ chmod +x get*.sh  

sh$ cd base
sh$ ls
bash-3.2-1.aix5.2.ppc.rpm          rpm-3.0.5-52.aix5.3.ppc.rpm
bzip2-1.0.5-3.aix5.3.ppc.rpm       rpm-build-3.0.5-52.aix5.3.ppc.rpm
gettext-0.10.40-8.aix5.2.ppc.rpm   rpm-devel-3.0.5-52.aix5.3.ppc.rpm
gzip-1.2.4a-10.aix5.2.ppc.rpm      tar-1.14-2.aix5.1.ppc.rpm
info-4.6-1.aix5.1.ppc.rpm          unzip-5.51-1.aix5.1.ppc.rpm
patch-2.5.4-4.aix4.3.ppc.rpm       
popt-1.7-2.aix5.1.ppc.rpm

sh$ rpm -hUv unzip-5.51-1.aix5.1.ppc.rpm
sh$ rpm -hUv zip-2.3-3.aix4.3.ppc.rpm
sh$ rpm -hUv bash-3.2-1.aix5.2.ppc.rpm

sh$ bash
bash-3.2# 
```

### Management
```bash
# Exit from basic VIOS console to common AIX ksh
oem_setup_env
# Adminitration and configuration console
smit

#If you want to use bash as a login shell, you first have to add it to the
#list of shells in /etc/security/login.cfg. 
#Then use `chsh` to change your individual setting.
```

### Software installation
```bash
cd <path_to_package>
inutoc .
installp -aXY -d<path_to_package> all
# Check if package is installed or not:
lslpp -L <package_name>
```

### Mirroring rootvg
```bash
extendvg rootvg hdisk1
mirrorvg rootvg
bootlist -m normal hdisk0 hdisk1 
bosboot -ad hdisk0
bosboot -ad hdisk1
# Checking
bootlist -o -m normal
```

### Network
```bash
Shared Ethernet adapter coming soon
```

### Hardware
```bash
# Refresh hardware configuration(aix and vios respectively):
cfgmgr
cfgdev
# Rename hard drive:
rendev -l <old_name> -n <new_name>
rendev -l hdisk3 -n hdisk33
# Enable PVID:
chdev -l hdiskX -a pv=yes
# Change reserve policy to hard drive
chdev -l hdiskX -a reserve_policy=no_reserve
# Clear the owning volume manager from a disk
chpv -C hdiskX
```

### Virtual devices
```bash
# Checking all virtual mappings to particular vhost:
lsmap -vadapter vhost
# Make a virtual hard drive for particular vhost:
# -f - flag to forcing device creation if you're making shared hard drive
mkvdev [-f] -vdev hdiskX -vadapter vhostX -dev <virtual_device_name>
# Make a virtual cd-rom device for particular vhost:
mkvdev -fbo -vadapter vhostX -dev <virtual_device_name>
```

### Zabbix agent
```
# Dependencies:
rpm -ivh ftp://www.oss4aix.org/latest/aix61/gettext-0.10.40-8.aix5.2.ppc.rpm
rpm -ivh ftp://www.oss4aix.org/compatible/aix61/expat-2.1.0-1.aix5.1.ppc.rpm
rpm -ivh ftp://www.oss4aix.org/compatible/aix61/libgcc-4.7.2-1.aix6.1.ppc.rpm
rpm -ivh ftp://www.oss4aix.org/compatible/aix61/libffi-3.0.11-2.aix5.1.ppc.rpm
rpm -ivh ftp://www.oss4aix.org/compatible/aix61/glib2-2.30.3-1.aix5.1.ppc.rpm
rpm -ivh ftp://www.oss4aix.org/compatible/aix61/libiconv-1.14-2.aix5.1.ppc.rpm

# Main
mkgroup zabbix
useradd -g zabbix zabbix

mkdir /var/run/zabbix
touch /var/run/zabbix/zabbix_agentd.pid
mkdir /var/log/zabbix
touch /var/log/zabbix/zabbix_agentd.log

chown -R zabbix:zabbix /var/log/zabbix
chown -R zabbix:zabbix /var/run/zabbix
chown zabbix:zabbix /etc/zabbix_agentd.conf

/usr/sbin/zabbix_agentd --config /etc/zabbix_agentd.conf

vi /etc/inittab
zabagent:2:once:/usr/sbin/zabbix_agentd --config /etc/zabbix_agentd.conf
```

### Update BOS
* Download SP and TL update
* Unpack update archive to NFS folder
* Mount NFS folder on target server
* Remove old standby BOS instance
```bash
# R - remove, p - preview (do not perform actual run)
multibos -Rp
multibos -R
```
* Create new stanby BOS instance
```bash
# X - expand file system if needed, s - setup, p - preview (do not perform actual run)
multibos -Xsp
multibos -Xs 
```
* Check bootorder
```bash
bootlist -m normal -o
```
* Checking newly created BOS
```bash
multibos -S
MULTIBOS> oslevel -s
MULTIBOS> exit
```
* Update of newly created stanby BOS
```bash
# X - expand file system if needed, c - custamized update,  p - preview (do not perform actual run), l - location
multibos -Xacp -l /mnt/nfs/update/
multibos -Xac -l /mnt/nfs/update/
```
* Checking updated BOS
```bash
multibos -S
MULTIBOS> oslevel -s
MULTIBOS> exit
```
* Umount NFS folder
```bash
umount /mnt/nfs/
```
* Making updated stanby BOS bootable in the first place
```bash
multibos -B
```
* Reeboot and check
```bash
shutdown -Fr
bootinfo -v
oslevel -s
```
* If we don't like "bos_" prefix
``bash
Remove old BOS: multibos -R
Making new clean BOS: multibos -sX
Making new clean BOS bootable in the first palce: multibos -B
Reboot: shutdown -Fr
Checking that we booted in non-prefixed BOS: bootinfo -v
Checking that everything is updated: oslevel -s
Removing preficex BOS: multibos -R
```

