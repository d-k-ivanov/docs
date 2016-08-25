### Long apps deployment
**Subject:** TC7 very slow SessionIdGenerator SecureRandom initialization

**From list:** tomcat-user

TC7+ can often take a long time to start up due to slow initialization of the SessionIdGenerator - it can take up to nearly 2-3 minutes.

TC7+ uses secure randomizer /dev/urandom to generate **Session ID** but JRE uses /dev/random instead for "Oracle security reasons" so it causes some intitialisation delays when random generator waits to sufficient amount entropy.

There is some issues about it: JDK-6521844, JDK-6521844, 

To view amount of available entropy:
```bash
cat /proc/sys/kernel/random/entropy_avail
```

To avoid this behaviour you need to set JAVA_OPTS manually like bellow:
```bash
JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom" /opt/apache-tomcat-7.0.70/bin/startup.sh
```
