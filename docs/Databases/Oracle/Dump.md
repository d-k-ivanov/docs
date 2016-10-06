### Fast oracle database dump creation
This way of making dump isn't safe, but convenient within clean or dev environment.
```
# Export
expdp / full=Y dumpfile=<DBNAME>.dmp logfile=expdp<DBNAME>.log
expdp 'DBNAME'/DBPASSWORD@SID dumpfile=<dumpfile>.dmp nologfile=Y

# Import 
impdp / full=Y dumpfile=<DBNAME>.dmp logfile=impdp<DBNAME>.log 
impdp 'DBNAME'/DBPASSWORD@SID dumpfile=<dumpfile>.dmp nologfile=Y
```