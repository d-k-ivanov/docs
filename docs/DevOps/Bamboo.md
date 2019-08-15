# Bamboo

## Fix PowerShell Task on Windows Agent

```ps1
Remove-ItemProperty -Path 'Registry::HKEY_USERS\.DEFAULT\Environment\' -Name PATH
```
