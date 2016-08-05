### Fast oracle database dump creation
This way of making dump isn't safe, but convenient within clean or dev environment.
```
# Export
expdp / full=Y dumpfile=<DBNAME>.dmp logfile=expdp<DBNAME>.log
# Import 
impdp / full=Y dumpfile=<DBNAME>.dmp logfile=impdp<DBNAME>.log 
```