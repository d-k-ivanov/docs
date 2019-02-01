## Use domain credentials from non domain worksation

```sh
runas /netonly /user:DOMAIN\username "<program>"
# DNS Management
#runas /netonly /user:username@domain "%SystemRoot%\system32\mmc.exe %SystemRoot%\system32\dnsmgmt.msc"
# AD Users and Computers
#runas /netonly /user:username@domain "%SystemRoot%\system32\mmc.exe %SystemRoot%\system32\dsa.msc"
```

## Connect to Domain resource from non domain ws

```sh
net use \\fqdn-to-resource /USER:username@domain.name
```