### Create NATted local vSwitch
```powershell
# Opent PowerShell console:
powershell

# Create simple internal vSwitch:
New-VMSwitch -SwitchName "NAT" -SwitchType Internal

# Write down index of network adapter:
Get-NetAdapter

# Set network addresses:
New-NetIPAddress -IPAddress <NAT Gateway IP> -PrefixLength <NAT Subnet Prefix Length> -InterfaceIndex <ifIndex>
# New-NetIPAddress -IPAddress 172.188.188.1 -PrefixLength 24 -InterfaceIndex 46


New-NetNat -Name <NAT_NetworkName> -InternalIPInterfaceAddressPrefix <NAT_Subnet/prefix>
# New-NetNat -Name LocalNatNetwork -InternalIPInterfaceAddressPrefix 172.188.188.0/24

# Diagnostic
Get-NetNat
Get-VMSwitch

# Removing NAT network
Get-NetNat | Remove-NetNat

# Removing vSwitch
Get-NetIPAddress -InterfaceAlias "vEthernet(<name of vSwitch>)"
Remove-NetIPAddress -InterfaceAlias "vEthernet(<name of vSwitch>)" -IPAddress <IPAddress> 
```