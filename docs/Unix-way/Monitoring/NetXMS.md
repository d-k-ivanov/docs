### Web console
```bash
cd /opt/
wget http://apache-mirror.rbc.ru/pub/apache/tomcat/tomcat-7/v7.0.70/bin/apache-tomcat-7.0.70.tar.gz
tar zxvf apache-tomcat-7.0.70.tar.gz

iptables -I INPUT -p tcp --dport 8005 -j ACCEPT
iptables -I INPUT -p tcp --dport 8009 -j ACCEPT
iptables -I INPUT -p tcp --dport 8080 -j ACCEPT
iptables -I INPUT -p tcp --dport 8443 -j ACCEPT

/opt/apache-tomcat-7.0.70/bin/startup.sh

# ...Wait until tomcat is started...

wget -O /opt/apache-tomcat-7.0.70/webapps/nxmc-2.0.5.war http://www.netxms.org/download/webui/nxmc-2.0.5.war

http://<ip_address>:8080/nxmc-2.0.5/nxmc
```

### WMI Scripts
```bash
#Query:
/usr/local/bin/nxget 192.168.122.252 "WMI.Query(root\CIMV2,SELECT * FROM XXX)"
```

### External parameter
```bash
ExternalParameterShellExec = KasperskyBasesState:C:\Windows\System32\cscript.exe //E:VBscript //NoLogo c:\Path_TO\kav.vbs
```

### SQL queries parsing from the log-file
```bash
# Print queries execution time. Change "SELECT" to keyword you want.
grep "SELECT" <log-file> | grep -oP '[0-9]* ms' | awk '{print $1}'

# Extarct all SQL-Inserts to file
grep -oP '\"INSERT INTO.*' <log-file> > insert.sql

# Extract all SQL-Selects to file
grep -oP '\"SELECT.*' <log-file> > select.sql

# Extract all other than inserts and selects t file
grep -v '\"SELECT.*' <log-file> | grep -v '\"INSERT INTO.*' > other.sql

# Extarct all SQL-Explains to file
grep -oP '\"EXPLAIN.*' other.sql > explain.sql

# Extarct all SQL-Updates to file
grep -v '\"EXPLAIN.*' other.sql | grep -oP '\"UPDATE.*' > update.sql

# Extarct all SQL-Deletes to file
grep -v '\"EXPLAIN.*' other.sql | grep -v '\"UPDATE.*' | grep -oP '\"DELETE.*' > delete.sql

# Extarct all SQL-Merges to file
grep -v '\"EXPLAIN.*' other.sql | grep -v '\"UPDATE.*' | grep -v '\"DELETE.*' | grep -oP '\"MERGE.*' > merge.sql
```

### Installation
* MySQL Database
```bash
mysql -u root -p mysql
mysql> CREATE DATABASE netxms;
mysql> GRANT ALL ON netxms.* TO netxms@localhost IDENTIFIED BY 'netxms';
mysql> \q
```
* Installation from source
```bash
tar zxvf netxms-x.x.x.tar.gz
#tar zxvf netxms-2.0.6.tar.gz

cd netxms-x.x.x
#cd netxms-2.0.6

# You need MySQl or MariadDB development packages for installation with "mysql" option
# On CentOS7 something like:
# yum install mysql55-mysql-devel
# yum install mariadb-devel

sh ./configure --with-server --with-mysql --with-agent --prefix=<path_to_custom_dir>
#sh ./configure --with-server --with-mysql --with-agent --prefix=/home/soft/netxms

make
make install

vim /etc/netxmsd.conf
---
DBDriver = <path_to_netxms_prefix>/lib/libnxddr_mysql.so
#DBDriver = /home/soft/netxms/lib/libnxddr_mysql.so
DBServer = localhost
DBName = netxms
DBLogin = netxms
DBPassword = netxms
LogFailedSQLQueries = yes
LogFile = <path_to_netxms_prefix>/var/netxms.log
#LogFile = /home/soft/netxms/var/netxms.log
---

vim /etc/nxagentd.conf
---
MasterServers = 127.0.0.1, localhost, centos-02.keeobot.net
LogFile = <path_to_netxms_prefix>/var/nxagentd.log
#LogFile = /home/soft/netxms/var/nxagentd.log
---

touch <path_to_log_files>
#touch /home/soft/netxms/var/netxms.log
#touch /home/soft/netxms/var/nxagentd.log

<path_to_netxms_prefix>/bin/nxdbmgr init <path_to_netxms_prefix>/sql/dbinit_mysql.sql
#/home/soft/netxms/bin/nxdbmgr init /home/soft/netxms/share/netxms/sql/dbinit_mysql.sql

<path_to_netxms_prefix>/bin/nxagentd -D6 -d
 <path_to_netxms_prefix>/bin/netxmsd -D6 -d
#/home/soft/netxms/bin/nxagentd -D6 -d
#/home/soft/netxms/bin/netxmsd -D6 -d

```

### Compile NXAgent with Mongo-C-Driver
```bash
cd /opt
# Mongo-C-Driver
wget https://github.com/mongodb/mongo-c-driver/releases/download/1.6.0/mongo-c-driver-1.6.0.tar.gz
tar xzvf mongo-c-driver-1.6.0.tar.gz && cd mongo-c-driver-1.6.0
./configure --prefix=/opt/mongo-c-driver
make && make install

#NetXMS Agent with Mongo and SNMP
git clone http://git.netxms.org/public/netxms.git nxbuild
cd nxbuild
git checkout stable-2.0
./configure --with-agent --with-mongodb=/opt/mongo-c-driver --with-snmp --prefix=/opt/netxms
make && make install
```
