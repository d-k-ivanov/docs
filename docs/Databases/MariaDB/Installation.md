### MariaDB server 5.5
```bash
yum install mariadb-server
vim /etc/my.cnf
---
[mysqld]
character-set-server=utf8
---

systemctl start mariadb
systemctl enable mariadb 

mysql_secure_installation

```

### MariaDB server 10.1
```bash
yum --enablerepo=centos-sclo-rh install rh-mariadb101-mariadb-server 
scl enable rh-mariadb101 bash 

vim /etc/profile.d/rh-mariadb101.sh 
---
#!/bin/bash

source /opt/rh/rh-mariadb101/enable
export X_SCLS="`scl enable rh-mariadb101 'echo $X_SCLS'`"
---

vim /etc/opt/rh/rh-mariadb101/my.cnf.d/mariadb-server.cnf 
---
[mysqld]
character-set-server=utf8 
---

systemctl start rh-mariadb101-mariadb
systemctl enable rh-mariadb101-mariadb 

mysql_secure_installation 

```
