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

### Basic commands:
* Management
```bash
# Exit from basic VIOS console to common AIX ksh
oem_setup_env
# Adminitration and configuration console
smit

#If you want to use bash as a login shell, you first have to add it to the
#list of shells in /etc/security/login.cfg. 
#Then use `chsh` to change your individual setting.
```
* Software installation:
```bash
cd <path_to_package>
inutoc .
installp -aXY -d<path_to_package> all
# Check if package is installed or not:
lslpp -L <package_name>
```
* Mirroring rootvg:
```bash
extendvg rootvg hdisk1
mirrorvg rootvg
bootlist -m normal hdisk0 hdisk1 
bosboot -ad hdisk0
bosboot -ad hdisk1
# Checking
bootlist -o -m normal
```
### GPFS:
* Instalaltion:
```bash
# on each LPAR:
cd /<path_to_gpfs_base_package>/base-3-5/
inutoc .
installp -aXY -d/<path_to_gpfs_base_package>/base-3-5 all
cd /<path_to_gpfs_fix_package>/fix-3-5-10/
inutoc .
installp -aXY -d/<path_to_gpfs_fix_package>/fix-3-5-10 all
lslpp -L gpfs.\*
```
* Creating cluster:
```bash
# You need to setup paswordless shh connection between nodes
# Add this path to /etc/environment on each node
export PATH=$PATH:/usr/lpp/mmfs/bin

mmcrcluster -N <PRIMARY_NODE_HOSTNAME>:manager-quorum -p PRIMARY_NODE_HOSTNAME -r /usr/bin/ssh -R /usr/bin/scp
mmchlicense server --accept -N PRIMARY_NODE_HOSTNAME
mmstartup -a
mmaddnode -N <SECONDARY_NODE_HOSTNAME>
mmaddnode -N <THIRDARY_NODE_HOSTNAME>
mmaddnode -N <N-ARY_NODE_HOSTNAME>
mmchcluster -s <SECONDARY_NODE_HOSTNAME>
mmchlicense server --accept -N <SECONDARY_NODE_HOSTNAME>
mmchlicense server --accept -N <THIRDARY_NODE_HOSTNAME>
mmchlicense server --accept -N <N-ARY_NODE_HOSTNAME>
mmstartup -N <SECONDARY_NODE_HOSTNAME>
mmstartup -N <THIRDARY_NODE_HOSTNAME>
mmstartup -N <N-ARY_NODE_HOSTNAME>
mmchnode --quorum --manager -N <SECONDARY_NODE_HOSTNAME>
# To check status of cluster:
mmlscluster
mmgetstate -a
```
* Create GPFS mirror partition:
```bash
# On primary node:
mkdir /etc/gpfs
vi /etc/gpfs/diskdesk.txt
### --insert in diskdesk.txt--
hdiskX:::dataAndMetadata:1:nsd1:
hdiskY:::dataAndMetadata:2:nsd2:
### --end of insert--

mmcrnsd -F /etc/gpfs/diskdesk.txt
mmshutdown -a
mmchconfig tiebreakerdisks="nsd1;nsd2"
mmstartup -a
mmcrfs /mnt/gpfs gpfsfs -F /etc/gpfs/diskdesk.txt -A yes -B 512K -M2 -m2 -R2 -r2 -n 2 -N 50000
mmlsconfig
mmmount all -a
mmchconfig minQuorumNodes=2
df -g
```
### Network:
```bash
Shared Ethernet adapter coming soon
```
### Hardware:
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
### Virtual devices:
```bash
# Checking all virtual mappings to particular vhost:
lsmap -vadapter vhost
# Make a virtual hard drive for particular vhost:
# -f - flag to forcing device creation if you're making shared hard drive
mkvdev [-f] -vdev hdiskX -vadapter vhostX -dev <virtual_device_name>
# Make a virtual cd-rom device for particular vhost:
mkvdev -fbo -vadapter vhostX -dev <virtual_device_name>
```
