
### Which process use port
* Linux
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
* AIX
```bash
lsof -i:<port>
ps -ef | grep <pid>
```
* Windows
```bash
netstat -aon | findstr "<port>"
pslist <PID>
```
