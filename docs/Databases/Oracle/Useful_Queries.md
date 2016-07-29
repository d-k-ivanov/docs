### View tablespaces by user
```sql
select distinct p.tablespace_name from dba_tablespaces p, dba_xml_tables x, dba_users u, all_all_tables t where t.table_name=x.table_name and t.tablespace_name=p.tablespace_name and x.owner=u.username;
```

### View all tablespaces: run by sysdba 
```sql
select * from dba_tablespaces;
```

### View charset
```sql
SELECT value$ FROM sys.props$ WHERE name = 'NLS_CHARACTERSET' ;
```

### Get status of instances
```sql
select instance_name, status, database_status from v$instance; 
select status from v$instance;
select logins from v$instance;
```

### Mount and open DB
```sql
ALTER DATABASE Mount;
ALTER DATABASE OPEN;
```

### Backup via RMAN
```sql
run {
shutdown immediate;
startup mount;
backup database;
alter database open;
}
```

### Enabling archivelog
```sql
SHUTDOWN;
STARTUP MOUNT EXCLUSIVE;
ALTER DATABASE ARCHIVELOG;
ALTER DATABASE OPEN;
SELECT log_mode FROM v$database;
```

### Open cursors
```sql
select * from v$parameter where name = 'open_cursors';
select value from v$parameter where name = 'open_cursors';
alter system set open_cursors=4000 scope=both;

-- Top list
select a.value, s.username, s.sid, s.serial# from v$sesstat a, v$statname b, v$session s where a.statistic# = b.statistic#  and s.sid=a.sid and b.name = 'opened cursors current' and s.username is not null order by value desc;
select * from ( select ss.value, sn.name, ss.sid from v$sesstat ss, v$statname sn where ss.statistic# = sn.statistic# and sn.name like '%opened cursors current%' order by value desc) where rownum < 11 ;

select USERNAME, OSUSER, PROCESS, MACHINE, PROGRAM, EVENT, STATE from v$session where sid in (select SID from ( select ss.value, sn.name, ss.sid from v$sesstat ss, v$statname sn where ss.statistic# = sn.statistic# and sn.name like '%opened cursors current%' order by value desc));
select SID,USERNAME, OSUSER, PROCESS, MACHINE, PROGRAM, EVENT, STATE from v$session where sid in (select SID from ( select ss.value, sn.name, ss.sid from v$sesstat ss, v$statname sn where ss.statistic# = sn.statistic# and sn.name like '%opened cursors current%' order by value desc) where rownum < 20);

select user_name, status, osuser, machine, a.sql_text 
  from v$session b, v$open_cursor a 
  where a.sid = b.sid and MACHINE='SERVER_NAME'; 
  
select * 
  from v$session b, v$open_cursor a 
  where a.sid = b.sid and MACHINE='SERVER_NAME';
  
select a.value, s.username, s.sid, s.serial# from v$sesstat a, v$statname b, v$session s where b.name = 'opened cursors current' order by value desc;
```
