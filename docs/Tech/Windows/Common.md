### Use domain credentials from non domain worksation
```bash
runas /netonly /user:DOMAIN\username "<program>"
# DNS Management
#runas /netonly /user:username@domain "%SystemRoot%\system32\mmc.exe %SystemRoot%\system32\dnsmgmt.msc"
# AD Users and Computers
#runas /netonly /user:username@domain "%SystemRoot%\system32\mmc.exe %SystemRoot%\system32\dsa.msc"
```