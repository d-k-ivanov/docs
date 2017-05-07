### Agent on AIX 6.1
```bash
Dependences:
1) gettext
  rpm -ivh ftp://www.oss4aix.org/latest/aix61/gettext-0.10.40-8.aix5.2.ppc.rpm
2) expat
  rpm -ivh ftp://www.oss4aix.org/compatible/aix61/expat-2.1.0-1.aix5.1.ppc.rpm
3) glib2
  rpm -ivh ftp://www.oss4aix.org/compatible/aix61/libgcc-4.7.2-1.aix6.1.ppc.rpm
  rpm -ivh ftp://www.oss4aix.org/compatible/aix61/libffi-3.0.11-2.aix5.1.ppc.rpm
  rpm -ivh ftp://www.oss4aix.org/compatible/aix61/glib2-2.30.3-1.aix5.1.ppc.rpm
4) libconv
  rpm -ivh ftp://www.oss4aix.org/compatible/aix61/libiconv-1.14-2.aix5.1.ppc.rpm

Install zabbix agent:

Unpack zabbix_agents_2.0.3.aix6100.powerpc.tar.gz on server and move files to their locations (bin, sbin)

Upload your zabbix_agentd.conf to /etc

mkgroup zabbix
useradd -g zabbix zabbix

└R└─└x└t└p└u└} └~└u└─└q└x└─└t└y└}└█└u └t└y└┌└u└{└└└─└┌└y└y, └├└p└z└|└█ └y └┘└┐└└└p└~└p└r└|└y└r└p└u└} └│└┌└p└r└p:
mkdir /var/run/zabbix
touch /var/run/zabbix/zabbix_agentd.pid
mkdir /var/log/zabbix
touch /var/log/zabbix/zabbix_agentd.log

chown -R zabbix:zabbix /var/log/zabbix
chown -R zabbix:zabbix /var/run/zabbix
chown zabbix:zabbix /etc/zabbix_agentd.conf

Run:
/usr/sbin/zabbix_agentd --config /etc/zabbix_agentd.conf

Autostart:
vi /etc/inittab
  zabagent:2:once:/usr/sbin/zabbix_agentd --config /etc/zabbix_agentd.conf

``` 

### SMTP
```
1) Get SendEmail(http://caspian.dotconf.net/menu/Software/SendEmail/)

2) Create a script "zabbix_sendemail" (chmod 755) in the AlertScriptsPath folder specified by /etc/zabbix/zabbix_server.conf
--------------------------------------
#!/bin/sh

export smtpemailfrom=zabbix@yourdomain.com
export zabbixemailto=$1
export zabbixsubject=$2
export zabbixbody=$3
export smtpserver=yoursmtpserver.com
export smtplogin=smtpuser
export smtppass=smtppassword

/usr/bin/sendEmail -f $smtpemailfrom -t $zabbixemailto -u $zabbixsubject -m $zabbixbody -s $smtpserver:25 -xu $smtplogin -xp $smtppass
--------------------------------------

3) Set the Action (Configurations / Actions in the php frontend)

4) Set the Media Type (Administration / Media types in the php frontend) script to zabbix_sendemail

5) Add the Media to the user (Administration / Users / user in php frontend) 
```