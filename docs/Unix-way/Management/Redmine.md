## CentOS 7 

### Dependencies
```bash
# For Ruby
yum "Devleopment Tools"
# For Redmine
yum install ImageMagick ImageMagick-devel libcurl-devel httpd-devel httpd mariadb-devel mariadb-server zlib-devel zlib
```

### Ruby
```bash
mkdir ~/dst && cd dst
wget https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.3.tar.gz
tar xzvf ruby-2.3.3.tar.gz && cd ruby-2.3.3
# Configure from root! Bacause sometime it doesn't see zlib
./configure
make
make install
```

### MariaDB Database
```bash
systemctl enable --now mariadb.service
firewall-cmd --add-service=mysql --permanent
firewall-cmd --reload

vi /etc/my.cnf
# --- VI ---
[mysqld]
character-set-server=utf8 
# ----------

mysql_secure_installation
Set root password? [Y/n] Y
Remove anonymous users? [Y/n] Y
Disallow root login remotely? [Y/n] Y
Remove test database and access to it? [Y/n] Y
Reload privilege tables now? [Y/n] Y

mysql -u root -p 
Enter password: *****
# --- SQL ---
CREATE DATABASE redmine CHARACTER SET utf8;
GRANT ALL PRIVILEGES ON redmine.* TO redmine@'localhost' IDENTIFIED BY 'my_password'; 
FLUSH PRIVILEGES;
EXIT;
# -----------
```

### Web server
```bash
rm -f /etc/httpd/conf.d/welcome.conf

vi /etc/httpd/conf/httpd.con
# --- VI ---
# Change those values
# Line 86
ServerAdmin your@emain.name
# Line 95
ServerName www.your-server-name:80
# Line 151
AllowOverride All
# Line 164
DirectoryIndex index.html index.cgi index.php
# At the end of file
ServerTokens Prod
KeepAlive On
# ----------

systemctl enable --now httpd.service
firewall-cmd --add-service=http --permanent 
firewall-cmd --reload 
```

### Redmine
```bash
cd ~/dst
wget --no-check-certificate  https://redmine.org/releases/redmine-3.3.2.tar.gz
tar xzvf redmine-3.3.2.tar.gz
mv redmine-3.3.2 /var/www/redmine

vi /var/www/redmine/config/database.yml
# --- VI ---
production:
    adapter: mysql2
    database: redmine
    host: localhost
    username: redmine
    password: "my_password"
    encoding: utf8
# ----------

vi /var/www/redmine/config/configuration.yml
# --- VI ---
production:
  email_delivery:
    delivery_method: :smtp
      smtp_settings:
        address: "your.email.server.name"
        port: 25
        authentication: :login
        domain: 'your.domain.name'
        user_name: 'username@your.domain.name'
        password: 'your-email-password'
        enable_starttls_auto: false
# ----------

cd /var/www/redmine/
gem install bundler --no-rdoc --no-ri 
bundle install --without development test postgresql sqlite 
bundle exec rake generate_secret_token RAILS_ENV=production
bundle exec rake db:migrate RAILS_ENV=production
gem install passenger --no-rdoc --no-ri
passenger-install-apache2-module

vi /etc/httpd/conf.d/passenger.conf
# --- VI ---
LoadModule passenger_module /usr/local/lib/ruby/gems/2.3.0/gems/passenger-5.1.2/buildout/apache2/mod_passenger.so
   <IfModule mod_passenger.c>
     PassengerRoot /usr/local/lib/ruby/gems/2.3.0/gems/passenger-5.1.2
     PassengerDefaultRuby /usr/local/bin/ruby
   </IfModule>

NameVirtualHost *:80
<VirtualHost *:80>
    ServerName redmine.pupupon.com
    DocumentRoot /var/www/redmine/public
</VirtualHost>
# ----------

chown -R apache:apache /var/www/redmine
chmod -R 777 /var/www/redmine/tmp

systemctl restart httpd

# http://your.redmone.server
# Initial username/password "admin/admin"
```