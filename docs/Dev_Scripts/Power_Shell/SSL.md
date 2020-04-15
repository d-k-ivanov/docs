## Enable TLS 1.1 ans 1.2 when invoking web request

```ps1
$AllProtocols = [System.Net.SecurityProtocolType]'Ssl3,Tls,Tls11,Tls12'
[System.Net.ServicePointManager]::SecurityProtocol = $AllProtocols

# Examples:
(Invoke-WebRequest -Uri "https://github.com/").StatusCode
Invoke-WebRequest -Uri "https://github.com/wixtoolset/wix3/releases/download/wix3111rtm/wix311-binaries.zip" -OutFile wix311-binaries.zip
```
