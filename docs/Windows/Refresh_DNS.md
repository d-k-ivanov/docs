### Re-register computer in domain DNS server:
```bash
# Open an elevated command prompt (cmd).
# Type ipconfig /all and verify that the correct DNS servers are listed. A domain controller, like any other domain-joined machine, should use only DNS servers that are inside the domain.
ipconfig /flushdns
ipconfig /registerdns

# To register DC's SRV records, type: 
net stop netlogon
net start netlogon
```