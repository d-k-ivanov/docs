### FirewallD Status
```bash
firewall-cmd --state

firewall-cmd --list-all

# Reload configuration                                                                              
firewall-cmd --reload
```

### Get security zones
```bash
firewall-cmd --get-zones
firewall-cmd --get-default-zone
firewall-cmd --get-active-zones
firewall-cmd --list-all-zones
firewall-cmd --set-default-zone=<zone_name>
firewall-cmd --get-zone-of-interface=<network_interface_name>
```

### Get ICMP types
```bash
firewall-cmd --get-icmptypes
```

### Services
```bash
firewall-cmd --get-services

# List default services
ls -la  /usr/lib/firewalld/services/

# Add service
firewall-cmd --add-service=<service_name>
firewall-cmd --add-service=<service_name> --permanent

# Remove service
firewall-cmd --zone=<zone_name> --remove-service=<service_name>
```

### Rules
```bash
firewall-cmd --permanent --add-source=<subnet>
firewall-cmd --permanent --add-port=<port>/<protocol>
```

