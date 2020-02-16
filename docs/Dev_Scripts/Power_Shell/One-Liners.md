
### Copy file to bunch of servers by ip
```ps1
# for ($i=<1>; $i -le <254>; $i++) { scp <Path-To-File> <username>@<XXX.XXX.XXX>.$($i):<Path-On-server> }
for ($i=2; $i -le 3; $i++) { scp C:\Users\dkiva\Downloads\jdk-10.0.1_linux-x64_bin.rpm divanov@172.30.30.$($i):~/jdk-10.0.1_linux-x64_bin.rpm }
```

### Unpack any tar.gz in current folder
```ps1
Get-Location | Get-ChildItem | ForEach-Object {tar zxf $_.Name }
```

### Kill process by name
```ps1
# Get-Process <ProcessName> | ForEach-Object { Stop-Process $_.Id }
Get-Process tar | ForEach-Object { Stop-Process $_.Id }
```
