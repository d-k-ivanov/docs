### GUI
```bash
yum groups install "GNOME Desktop"
startx
```

### Database pre-requirements
```bash
# Dependencies
yum install binutils compat-libcap1 gcc gcc-c++ glibc glibc.i686 glibc-devel glibc.i686 ksh libaio libaio.i686 libaio-devel libaio-devel.i686 libgcc libgcc.i686 libstdc++ libstdc++l7.i686 libstdc++-devel libstdc++-devel.i686 compat-libstdc++-33 compat-libstdc++-33.i686 libXi libXi.i686 libXtst libXtst.i686 make sysstat 

# Kernel
MEMTOTAL=$(free -b | sed -n '2p' | awk '{print $2}')
SHMMAX=$(expr $MEMTOTAL / 2)
PAGESIZE=$(getconf PAGE_SIZE)

cat >> /etc/sysctl.conf << EOF
fs.aio-max-nr = 1048576
fs.file-max = 6815744
kernel.shmmax = $SHMMAX
kernel.shmall = `expr \( $SHMMAX / $PAGESIZE \) \* \( $SHMMNI / 16 \)`
kernel.shmmni = 4096
kernel.sem = 250 32000 100 128
net.ipv4.ip_local_port_range = 9000 65500
net.core.rmem_default = 262144
net.core.rmem_max = 4194304
net.core.wmem_default = 262144
net.core.wmem_max = 1048576
EOF

sysctl -p 

# Users and groups
i=54321; for group in oinstall dba backupdba oper dgdba kmdba; do
groupadd -g $i $group; i=`expr $i + 1`
done

useradd -u 1200 -g oinstall -G dba,oper,backupdba,dgdba,kmdba -d /home/oracle oracle 
passwd oracle 

# Folders
mkdir -p /u01/app/oracle 
chown -R oracle:oinstall /u01/app 
chmod -R 775 /u01 

vim /etc/pam.d/login 
# Insert after "session required pam_namespace.so":
session    required     pam_limits.so

vim /etc/security/limits.conf 
# Add to the end of file:

oracle  soft  nproc   2047
oracle  hard  nproc   16384
oracle  soft  nofile  1024
oracle  hard  nofile  65536
oracle  soft  stack   10240
oracle  hard  stack   32768

su - oracle
vim ~/.bash_profile 
# Add to the end
umask 022
export ORACLE_BASE=/u01/app/oracle 
```

### Database software installation

```bash
# Upload installation software to /tmp:
scp linuxamd64_12102_database_se2_1of2.zip oracle@db_server:/tmp/
scp linuxamd64_12102_database_se2_2of2.zip oracle@db_server:/tmp/

# Login to DB server with X-Forwarding enabled:
ssh -Y oracle@db_server

# Unpack archives:
unzip linuxamd64_12102_database_se2_1of2.zip
unzip linuxamd64_12102_database_se2_2of2.zip

# Run Oracle universal installer
cd database/
./runInstaller 
```

Just follow installation steps in GUI:

* Step 01. Enter your **E-Mail** and Oracle Enterproise support **password**, if you have one
* Step 02. **(.)** Install database software only (we'll install database later)
* Step 03. Select parovriate type of installation. In simple case choose **"Single instance database installation"**
* Step 04. Choose prefered language. But **English** is recommended in all cases.
* Step 05. Select edidtion. It depends of distribution package. In this case **Standard Edition Two**
* Step 06. Choose path for oracle home directory. In our case everything will filled up by default.
* Step 07. Choose path for oracle inventory. In our case everything will filled up by default.
* Step 08. Choose oracle grroups. In our case everything will filled up by default. 
* Step 09. On this step you'll face swap error in most cases. Just ignore it. In any other errors look at oracle forum. **DO NOT IGNORE ANY ERRORS EXCEPT OF SWAP**
* Step 10. Install oracle database software
* Step 11. On this step installater demand you to execute 2 spripts from root user. Just run them.
* Step 12. Finish

```bash
vim ~/.bash_profile 

# Add to the end of file: 

export ORACLE_HOME=/u01/app/oracle/product/12.1.0/dbhome_1
export PATH=$PATH:$ORACLE_HOME/bin
```
 
### Net listener
Just run **netca** from oracle user and follow steps of configuration wizard

```bash
# Login to DB server with X-Forwarding enabled:                                                                                                                                                                
ssh -Y oracle@db_server

# Run Network listener configuration wizard:
netca
```

### Database
```
# Login to DB server with X-Forwarding enabled:                                                                                                                                                                
ssh -Y oracle@db_server

# Run Database configuration wizard:
dbca

```

Follow installation steps for fat installation:

* Step 01. Choose **(.) Create database**
* Step 02. **(.)** Create a database with default configuration
** Global Database name: input what name you like
** Storage type: **File System** (if you don't have ASM)
** Database character set: **AL32UTF8 - Unicode UTF-8 Universal character set**
** Choose password for sysdba account.
** Uncheck **[]Create As Container Database**
* Step 03. Look for any errors
* Step 04. Next
* Step 05. Finish


```bash
vim /etc/oratab 

#Set last synbol from "N" to "Y"
<database_SID>:/u01/app/oracle/product/12.1.0/dbhome_1:Y

vim ~/.bash_profile 
# Add to the end of file:

export ORACLE_SID=<database_SID>

```

### Autostart

* Oracle environemnt:
```bash
vim /etc/sysconfig/<SID>.oracledb

# Contents
ORACLE_BASE=/u01/app/oracle
ORACLE_HOME=/u01/app/oracle/product/12.1.0/dbhome_1
ORACLE_SID=<your_SID>
```

* Net listner service:
```bash
vim /usr/lib/systemd/system/<SID>@lsnrctl.service 

# Contents
[Unit]
Description=Oracle Net Listener
After=network.target

[Service]
Type=forking
EnvironmentFile=/etc/sysconfig/<SID>.oracledb
ExecStart=/u01/app/oracle/product/12.1.0/dbhome_1/bin/lsnrctl start
ExecStop=/u01/app/oracle/product/12.1.0/dbhome_1/bin/lsnrctl stop
User=oracle

[Install]
WantedBy=multi-user.target
```

* Database service:
```bash
vim /usr/lib/systemd/system/<SID>@oracledb.service 

# Contents
[Unit]
Description=Oracle Database service
After=network.target lsnrctl.service

[Service]
Type=forking
EnvironmentFile=/etc/sysconfig/<SID>.oracledb
ExecStart=/u01/app/oracle/product/12.1.0/dbhome_1/bin/dbstart /u01/app/oracle/product/12.1.0/dbhome_1
ExecStop=/u01/app/oracle/product/12.1.0/dbhome_1/bin/dbshut /u01/app/oracle/product/12.1.0/dbhome_1
User=oracle

[Install]
WantedBy=multi-user.target
```

* Systemd reload and enable:
```bash
systemctl daemon-reload 
systemctl enable <SID>@lsnrctl 
systemctl enable <SID>@oracledb 
```








