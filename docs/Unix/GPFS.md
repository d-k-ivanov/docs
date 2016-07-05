
### Change hostname on GPFS nodes
1. Preface.
```
#Old names:
10.10.10.10     OLD-SRV-NAME-01
10.10.10.10     OLD-SRV-NAME-02
#New names:
10.10.10.10     NEW-SRV-NAME-01
10.10.10.10     NEW-SRV-NAME-02

```
1. Stop all services which use GPFS
2. [On each node] add new names to /etc/hosts (old ones keep too)
```
10.10.10.10     NEW-SRV-NAME-01
10.10.10.11     NEW-SRV-NAME-02
```
3. [On master node] Shut down GPFS-cluster
```
mmshutdown -a
```
4. [On master node] Run command for configuration changing
```
# Change interface names to names placed after "-N" key
mmchnode --admin-interface=OLD-SRV-NAME-01 --daemon-interface=prodctx1 -N NEW-SRV-NAME-01
mmchnode --admin-interface=OLD-SRV-NAME-01 --daemon-interface=prodctx2 -N NEW-SRV-NAME-02
```
5. [On master node] Start GPFS-cluster
```
mmstartup -a
```
6. [On master node] Check cluster details and make sure that names were changed
```
mmlscluster
mmgetstate -a
```
7. [On each node] If everything right remove old records from /etc/hosts
8. [On maser node] Recheck than everything still OK
```
mmshutdown -a
mmstartup -a
mmlscluster
mmgetstate -a
```
