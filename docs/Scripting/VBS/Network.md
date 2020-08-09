### Convert Server Name to IpAddress
```vbs
webNodes = Array("server1.localdomain","server2.localdomain","server3.localdomain")

set objPing = GetObject("winmgmts:{impersonationLevel=impersonate}").ExecQuery ("select * from Win32_PingStatus where address = '" & webNode & "'")
for each objRetStatus in objPing
  if IsNull(objRetStatus.StatusCode) or objRetStatus.StatusCode<>0 then
    ipAddress = ""
  else
    ipAddress = objRetStatus.ProtocolAddress
  end if
next

WScript.Echo webNode & " " & ipAddress
WScript.Echo "https://eshop_user:8R63La1Gt2XmSRk@172.67.136.200/access/"&"enablers?rs="&ipAddress

```