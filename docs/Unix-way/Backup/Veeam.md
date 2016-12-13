### PowerShell script to perform scheduled backup on free version of Veeam
```powershell
& "C:\Program Files\Veeam\Backup and Replication\Backup\Initialize-VeeamToolkit.ps1" 
#
Set-Variable -name 1 -value "<ESXi(orVsphere)_server_address>" 
Set-Variable -name STORAGE_REPO -value "<name_of_predefined_veeam_storage_ropository>" 
#
Find-VBRViEntity -Name "name_of_virtual_machine_here" | Start-VBRZip -BackupRepository $STORAGE_REPO -RunAsync -AutoDelete In1Week -DisableQuiesce
```