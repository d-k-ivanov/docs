
### Windows 2008 Server R2

To release this error:
> Script cannot be loaded because the execution of scripts is disabled on this system.

```ps1
# Run as Administrator
Set-ExecutionPolicy RemoteSigned

# There is following parameters:
# * Restricted - No scripts can be run. Windows PowerShell can be used only in interactive mode.
# * AllSigned - Only scripts signed by a trusted publisher can be run.
# * RemoteSigned - Downloaded scripts must be signed by a trusted publisher before they can be run.
# * Unrestricted - No restrictions; all Windows PowerShell scripts can be run.
```

### Show current logged user

```ps1
gwmi win32_computersystem -comp $computer | select USername,Caption,Manufacturer
Get_WmiObject win32_computersystem -comp $computer | select USername,Caption,Manufacturer
```

### List of logged in users (any user in any time)

```ps1
Get-WmiObject Win32_LoggedOnUser -ComputerName divanov-dev | `
Select __SERVER, Antecedent -Unique                         | `
%{"{0} : {1}\{2}" -f $_.__SERVER, $_.Antecedent.ToString().Split('"')[1],$_.Antecedent.ToString().Split('"')[3]}
```

### Read from keyboard

```ps1
$variable=read-host "Enter computer name:"
```
