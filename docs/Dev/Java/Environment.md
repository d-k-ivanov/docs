### Windows variables
```bash
JAVA_HOME         : C:\Program Files\Java\jdkx.x.x_xxx
JDK_HOME          : %JAVA_HOME%
JRE_HOME          : %JAVA_HOME%\jre
CLASSPATH         : .;%JAVA_HOME%\lib;%JAVA_HOME%\jre\lib
PATH              : <all_your_recors>;%JAVA_HOME%\bin
# Optional
JAVA_TOOL_OPTIONS : -Dfile.encoding="UTF-8"
```

### Unix variables
```bash
# If you install JRE only:
JAVA_HOME=/path/to/jre
JRE_HOME=$JAVA_HOME
CLASSPATH=.;$JAVA_HOME/lib
PATH=$PATH;$JAVA_HOME/bin

# If you install JDK:
JAVA_HOME=/path/to/jdk
JDK_HOME=$JAVA_HOME
JRE_HOME=$JAVA_HOME/jre
CLASSPATH=.;$JAVA_HOME/lib;$JAVA_HOME/jre/lib
PATH=$PATH;$JAVA_HOME/bin
```