
### Show current logged user
```
gwmi win32_computersystem -comp $computer | select USername,Caption,Manufacturer
Get_WmiObject win32_computersystem -comp $computer | select USername,Caption,Manufacturer
```

### List of logged in users (any user in any time)
```
Get-WmiObject Win32_LoggedOnUser -ComputerName msk-sales-02 | Select __SERVER, Antecedent -Unique | %{"{0} : {1}\{2}" -f $_.__SERVER, $_.Antecedent.ToString().Split('"')[1],$_.Antecedent.ToString().Split('"')[3]}
```
### Read from keyboard
```
$variable=read-host "Enter computer name:"
```