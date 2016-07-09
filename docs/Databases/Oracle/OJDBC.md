### BUG: 9632480

*OJDBC 12.1.0.2 - BUG: ORA-01000: maximum open cursors exceeded*

We need:

* ojdbc7.jar
* p19632480_121020_Generic.zip
* JRE

> We need to update OracleDatabaseMetaData.class in our ojdbc7.jar archive

```bash
unzip p19632480_121020_Generic.zip
```

Get folder **./p19632480_121020_Generic/19632480/files/jdbc/lib/ojdbc7.jar** from archvive and place it to *ojdbc7.jar* file location

Make sure that your JAVA_HOME is exported

Change working directory to ojdbc7.jar location and run:
```bash
$JAVA_HOME/jar -uf ojdbc7.jar
```
