
### Create 
```
CREATE TABLESPACE tablespace_name DATAFILE 'tablespace_name.ora' SIZE 20M AUTOEXTEND ON;
### You need this line only for Oracle 12 
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
CREATE USER tablespace_username IDENTIFIED BY tablespace_username_password DEFAULT TABLESPACE tablespace_name;
GRANT ALL PRIVILEGES TO tablespabe+username ;
```