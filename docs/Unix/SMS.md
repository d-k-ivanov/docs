
### Via minicom 
* *minicom -s*
```
AT+CMGF=1
AT+CMGS="+xxxxxxxxxx"
Write message here. <ctrl+z>
```

### SMSd
```
smssend +xxxxxxxxxxx 'One-Line Test 02' > /dev/null 2>&1
```
* Example smsd.conf. Read the manual for a description
```
devices = xenium0
logfile = /var/log/smsd/smsd.log
loglevel = 2
#user = smstools
user = nagios
# 3.1.5 introduced smart logging
# once your configuration is OK, set log level lower (5 is good in most cases)
smart_logging = yes
infofile = /run/smsd/smsd.working
pidfile = /run/smsd/smsd.pid

[xenium0]
device = /dev/ttyUSB0
#pin = 1122
pin = ignore
baudrate = 115200
rtscts = no
#init = ATE0
#init = at+cpms="sm","sm",""
#init = AT+CMGF=1
loglevel_lac_ci = 8
incoming = yes
incoming = high 
```