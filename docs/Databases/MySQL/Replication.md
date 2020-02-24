### Replication

```bash
# On Master:
vim /etc/mysql/my.cnf:
   server-id   = 2
   log_bin     = /var/lib/mysql-binlog/mysql-bin.log

# SQL on master:
mysql> grant replication slave on *.* to replica@'%' identified by '<password>';
mysql> flush privileges;
mysql> exit

# On Slave:
vim /etc/mysql/my.cnf:
   server-id   = 3
   log_bin     = /var/lib/mysql-binlog/mysql-bin.log

# SQL on Slave
mysql> change master to
      -> master_host='<master_server>',
      -> master_user='replica',
      -> master_password='<password>',
      -> master_log_file='<bin_log>',
      -> master_log_pos=<bin_log_position>;
```
