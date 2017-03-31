### Some REST commands
```bash
# Disable Real server 
curl -k -X GET https://username:password@ip_address/access/disablers?rs=realServerIP

# Enable Real server 
curl -k -X GET https://username:password@ip_address/access/enablers?rs=realServerIP

# Get any parameter
curl -k -X GET https://username:password@ip_address/access/get?param=parameterName

```