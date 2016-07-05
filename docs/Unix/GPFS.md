
### Instalaltion on AIX:
```bash
# on each node:
cd /<path_to_gpfs_base_package>/base-3-5/
inutoc .
installp -aXY -d/<path_to_gpfs_base_package>/base-3-5 all
cd /<path_to_gpfs_fix_package>/fix-3-5-10/
inutoc .
installp -aXY -d/<path_to_gpfs_fix_package>/fix-3-5-10 all
lslpp -L gpfs.\*
```
### Creating cluster:
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
### Create GPFS mirror partition:
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

### Autostart GPFS
```
mmchconfig autoload=yes
```

### Increase Inodes
```
mmchfs <fsname> -F 1M
```

### Change hostname on GPFS nodes
* *[Preface]*
```
#Old names:
10.10.10.10     OLD-SRV-NAME-01
10.10.10.10     OLD-SRV-NAME-02
#New names:
10.10.10.10     NEW-SRV-NAME-01
10.10.10.10     NEW-SRV-NAME-02

```
* *[Preface]* Stop all services which use GPFS
* *[On each node]* add new names to /etc/hosts (old ones keep too)
```
10.10.10.10     NEW-SRV-NAME-01
10.10.10.11     NEW-SRV-NAME-02
```
* *[On master node]* Shut down GPFS-cluster
```
mmshutdown -a
```
* *[On master node]* Run command for configuration changing
```
# Change interface names to names placed after "-N" key
mmchnode --admin-interface=OLD-SRV-NAME-01 --daemon-interface=prodctx1 -N NEW-SRV-NAME-01
mmchnode --admin-interface=OLD-SRV-NAME-01 --daemon-interface=prodctx2 -N NEW-SRV-NAME-02
```
* *[On master node]* Start GPFS-cluster
```
mmstartup -a
```
* *[On master node]* Check cluster details and make sure that names were changed
```
mmlscluster
mmgetstate -a
```
* *[On each node]* If everything right remove old records from /etc/hosts
* *[On maser node]* Recheck than everything still OK
```
mmshutdown -a
mmstartup -a
mmlscluster
mmgetstate -a
```

