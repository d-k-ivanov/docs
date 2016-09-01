### Web console
```bash
cd /opt/
wget http://apache-mirror.rbc.ru/pub/apache/tomcat/tomcat-7/v7.0.70/bin/apache-tomcat-7.0.70.tar.gz
tar zxvf apache-tomcat-7.0.70.tar.gz

iptables -I INPUT -p tcp --dport 8005 -j ACCEPT
iptables -I INPUT -p tcp --dport 8009 -j ACCEPT
iptables -I INPUT -p tcp --dport 8080 -j ACCEPT
iptables -I INPUT -p tcp --dport 8443 -j ACCEPT

/opt/apache-tomcat-7.0.70/bin/startup.sh

# ...Wait until tomcat is started...

wget -O /opt/apache-tomcat-7.0.70/webapps/nxmc-2.0.5.war http://www.netxms.org/download/webui/nxmc-2.0.5.war

http://<ip_address>:8080/nxmc-2.0.5/nxmc
```

### WMI Scripts
```bash
#Query:
/usr/local/bin/nxget 192.168.122.252 "WMI.Query(root\CIMV2,SELECT * FROM XXX)"
```

### External parameter
```bash
ExternalParameterShellExec = KasperskyBasesState:C:\Windows\System32\cscript.exe //E:VBscript //NoLogo c:\Path_TO\kav.vbs
```
