### Fork: Resource temporarily unavailable on AIX
To investigate the promles you need to run this bunch of commands:
```
cat /etc/passwd
```
From root you need to look at limint of every active user:
```
ulimit -a
su oracle -c "ulimit -a"
su mongod -c "ulimit -a"
su userX -c "ulimit -a"
```
Look at system wide defined limits:
```
cat /etc/security/limits
```
Look at kernel parameters, especially on *maxuproc*
```
lsattr -El sys0
```
Look at count of running processes by user:
```
ps -f -l -uroot | wc -l
ps -f -l -uoracle | wc -l
ps -f -l -umongod | wc -l
ps -f -l -uuserX | wc -l
```
And after all look at avaible mamory and swap:
```
svmon -G -O unit=MB
```


