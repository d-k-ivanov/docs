### Web console:
```bash
cd /opt/
wget http://apache-mirror.rbc.ru/pub/apache/tomcat/tomcat-7/v7.0.70/bin/apache-tomcat-7.0.70.tar.gz
tar zxvf apache-tomcat-7.0.70.tar.gz

/opt/apache-tomcat-7.0.70/bin/startup.sh

# ...Wait until tomcat is started...

wget -O /opt/apache-tomcat-7.0.70/webapps/nxmc-2.0.5.war http://www.netxms.org/download/webui/nxmc-2.0.5.war

http://<ip_address>:8080/nxmc-2.0.5/nxmc
```
