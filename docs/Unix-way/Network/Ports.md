
## Which process uses port
### Linux
```bash
# Find out PID via ss
ss -nltp | grep <port>
# Find out PID deprecated netstat:
netstat -tulpn | grep <port>
# Find out particular binary
ls -l /proc/<pid>/exe
# Find out full run command
ps -ef | grep <PID>
```
### AIX
```bash
lsof -i:<port>
ps -ef | grep <pid>
```
### Windows
```bash
netstat -aon | findstr "<port>"
pslist <PID>
```

## Which port is used by a process
### nix
```bash
sudo lsof -i -P -n | grep LISTEN | grep <process>
# Remember about sudo: root access rights is required to see at non-current-user processes
sudo netstat -tulpn | grep LISTEN | grep <process>
# For FreeBSD or MacOS:
sudo netstat -anp tcp | grep LISTEN | grep <process>
sudo netstat -anp udp | grep LISTEN | grep <process>
# Use flags -T fot TCP -U for UDP or both. You can use any IP address instead localhost.
sudo nmap -sTU -O localhost
```
### Windows
```bash
netstat -bano | findstr /R /C:"[LISTING]" | findstr /R /C:"<process>"
```
