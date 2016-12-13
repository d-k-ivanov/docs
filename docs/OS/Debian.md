> This section describes work with Debian-based Linux distributives like:
> Debian Linux, Ubuntu Linux, Astra Linux, Linux Mint

### Apt
```bash
# Show installed packages
apt --installed list
# Search for software
apt-cache search <pattern>
# Install package
apt-get install <package_name>
```
### Dpkg 
```bash
# To get a list of packages installed locally do this in your terminal:
dpkg --get-selections | grep -v deinstall
# To get a list of a specific package installed:
dpkg --get-selections | grep postgres
# To save that list to a text file called packages on your desktop do this in your terminal:
dpkg --get-selections | grep -v deinstall > ~/Desktop/packages
# Alternatively, simply use
dpkg -l
```