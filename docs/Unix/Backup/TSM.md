### Queries
```bash
# Check backup
q ev * * 

# Check path
q path 

# Check drive
q dri 

# Status
q stat

# Tape status
q vol

# Check volumes in the tape library                                                                 
q libvol

# Check processes
q pro

# Cancel process
can pro (<process>)

# Check pools
q stg

# Check working sessions
q sess

# Cancel session
can sess (<session>)

# Shedule backup
q eve domain name schedulename

# Viwe assigned nodes in a Tivoli server
q node

# Check backup space utilized for each file system of a server
q filespace

# View activity log
q actlog
q act begind=mm/dd/yyyy begint=hh:mm:ss endd= mm/dd/yyyy endt=hh:mm:ss
q act begind=today-1 begint=00:00
q act search=transferred begint=00:00
q act search=nodenam

# Get detailed drive report
q drive f=d

# Get detailed information about tape library
q library f=d

# Get requests
q req
# Reply to request 
reply (<request>)

# Schedule
q sched
q sched f=d
q sched * type=admin f=d

```

### Unload tape
```bash
Configure Library → Drive → []Power ON
Configure Library → Drive → [X]Power ON
Wait for 5 minutes until tape will be rewinded
# Move tape to empty slot
Manage Library → Move Media 
```

### How to get logs
```
# Library logs
Service → View Logs
Save Service Dump

# Drive logs
Service Library → Save Drive Dump
```

### Changes
```bash
# Path (set online)
#Drive1:
UPD PATH TSM DRIVE01 SRCT=SERVer DESTT=DRIVE LIBR=TS3100 ONL=Y
#Drive2:
UPD PATH TSM DRIVE02 SRCT=SERVer DESTT=DRIVE LIBR=TS3100 ONL=Y

# Update drive status to online
update path sourceservername TAPE0 srct=server destt=drive libr=ts3200 online=yes

# Drive (set online)
#Drive1:
UPD DRI TS3100 DRIVE01 ONL=Y
#Drive2:
UPD DRI TS3100 DRIVE02 ONL=Y

# Change a library volume ( L41117L4 ) status to scratch from private
UPDATE LIBVOLUME TS3200 L41117L4 STATUS=SCRATCH

# Change a tivoli login password of a node
update node nodename "admin" domain=domainname forcepwreset=Yes

# Add new tape L41116L4 to a storagepool
define vol storagepoolname L41116L4

# Delete data inside a tape media L41116L4
delete volume L41116L4 discarddata=yes

# Set serial number of a drive in tape library
UPDATE DRIVE TS3200 TAPE0 ELEMENT=autodetect ONLINE=Yes WWN="2002000E11107B6C" SERIAL=autodetect

# Detect label of a tape in tape library
label libvol t3200 checkin=scratch labelsource=barcode search=bulk waittime=0

# Remove tape media from tape library
checkout libvol ts3200 VOLLIST=A00015L3,A00019L3 CHECKLABEL=YES REMOVE=YES

# Add and label new tapes into library
LABEL libvol TS3200 search=yes labelsource=barcode overwrite=NO checkin=SCRATCH WAITTIME=0

# Assign a tape drive to a server
UPDATE PATH servername TAPE0 SRCTYPE=SERVER DESTTYPE=DRIVE LIBRARY=TS3200 DEVICE=\\.\Tape0 ONLINE=YES AUTODETECT=no
```

### Creating backups
```bash
# Create a new schedule backup (incremental) for a node
UPDATE SCHEDULE domainname nodename desc="daily incremental backup for a server" action=Incremental options=-subdir=yes objects=""/fs1/*" "/fs2/*" "/home/user1/*"" priority=5startdate=mm/dd/yyyy starttime=hh:mm duration=1 duru=Houperiod=1 perunits=Day dayofweek=Any expiration=never

# Full backup of Tivoli database manually to file on local disk
backup db dev=FILECLASS type=full
```

### Startup
```bash
# Start Tivoly on AIX
cd /usr/tivoli/tsm/client/ba/bin
nohup dsmc sched &
nohup dsmcad &

cd /usr/tivoli/tsm/StorageAgent/bin
nohup ./dsmsta &

ps -ef | grep dsm
```

### If tape is not shown
```bash
checkin libvolume TS3100 search=yes status=scratch       
checkin libvolume TS3100 search=yes status=private
```

