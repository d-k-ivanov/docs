### Convert Nagios server logs to human-readable format
```bash
cat <path_to_nagios_log_file> | perl -pe 's/(\d+)/localtime($1)/e'
``` 

### Check TCP port from remote Windows PC
* Download [*check_tcp.exe*](https://exchange.nagios.org/components/com_mtree/attachment.php?link_id=892&cf_id=24) to C:\Program Files\NSClient++\
* Create PowerShell external script - *check_tcp_port* :
```powershell
$exe = 'C:\Program Files\NSClient++\check_tcp.exe'
$arg1 = '-H'
$arg2 = '<place_remote_host_ip_here'
$arg3 = '-p'
$arg4 = '<place_remote_tcp_port_here>'
$arg5 = '-w'
$arg6 = '100'
$arg7 = '-c'
$arg8 = '1000'

$cmd = $arg1 + " " + $arg2 + " " + $arg3 + " " + $arg4 + " " + $arg5 + " " + $arg6 + " " + $arg7 + " " + $arg8
$process = New-Object -TypeName System.Diagnostics.Process
$process.StartInfo.FileName = $exe
$process.StartInfo.Arguments = $cmd
$process.StartInfo.RedirectStandardOutput = $true
$process.StartInfo.UseShellExecute = $false
$status = $process.Start()
$process.WaitForExit()
$process.StandardOutput.ReadToEnd()
exit $process.ExitCode  
```
* Make a record in Nagion Agent configuration file:
```bash
[/settings/external scripts/scripts]
check_tcp_port =  cmd /c echo scripts\check_tcp_mq.ps1; exit($lastexitcode) | powershell.exe -command -
```