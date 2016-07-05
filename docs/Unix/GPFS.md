
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
