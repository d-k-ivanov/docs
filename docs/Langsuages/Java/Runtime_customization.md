### Java custom user and system preferencies path
```
# From user which will start particular hava application

mkdir -p <new_system_prefs>
mkdir -p <new_user_prefs>
chmod -R 755 <new_system_prefs>
chmod -R 755 <new_user_prefs> 

export JAVA_OPTS="-Djava.util.prefs.systemRoot=<new_system_prefs> -Djava.util.prefs.userRoot=<new_user_prefs>"

# start application

```