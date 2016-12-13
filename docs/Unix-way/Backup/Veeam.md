### PowerShell script to perform scheduled backup on free version of Veeam
```powershell
& "C:\Program Files\Veeam\Backup and Replication\Backup\Initialize-VeeamToolkit.ps1" 
#
Set-Variable -name 1 -value "<ESXi(orVsphere)_server_address>" 
Set-Variable -name STORAGE_REPO -value "<name_of_predefined_veeam_storage_ropository>" 
#
Find-VBRViEntity -Name "name_of_virtual_machine_here" | Start-VBRZip -BackupRepository $STORAGE_REPO -RunAsync -AutoDelete In1Week -DisableQuiesce

# Outpul example:
# PS C:\Users\monitor> Set-Variable -name 1 -value "192.168.168.100"
# PS C:\Users\monitor> Set-Variable -name DISKF -value "DISK_F_HUGE"
# PS C:\Users\monitor> Find-VBRViEntity -Name "SUPERSERVER-01" | Start-VBRZip -BackupRepository $DISKF -RunAsync -AutoDelete In1Week -DisableQuiesce
#
#Job Name             State      Start Time             End Time               Result
#--------             -----      ----------             --------               ------
#SUPERSERVER-01_2016-1... Starting   13.12.2016 15:42:08    01.01.1900 0:00:00     None       
```