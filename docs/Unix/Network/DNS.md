### Get ip addresses
```bash
host <hostname> | grep " has address "| cut -d" " -f4
```