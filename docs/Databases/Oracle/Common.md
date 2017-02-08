### Show tables
```sql
SELECT owner, table_name FROM dba_tables;
SELECT owner, table_name FROM all_tables;
SELECT table_name FROM user_tables;
```

### Show filterd tables
```sql
SELECT table_name FROM user_tables WHERE table_name LIKE '%<any_pattern>%';
# Example: SELECT table_name FROM user_tables WHERE table_name LIKE '%BLACK_LIST%';
```

### Login to database
```bash
# First of all you can just use clean 'sqlplus' and it request user and password
sqlplus <username>/<password>@<oracle_database_hostname>
```

### Run SQL script
```sql
# Unix
@/path/to/sql_script.sql
START /path/to/sql_script.sql
# Windows
@c:\path\to\sql_script.sql
START c:\path\to\sql_script.sql
```

### Show table information
```sql
DESCRIBE <table_name>
```

