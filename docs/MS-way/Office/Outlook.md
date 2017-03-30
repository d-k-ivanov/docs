### Outlook blocked access to the following potentially unsafe attachments
```bash
1. Run regedit
2. Go to HKEY_CURRENT_USER\Software\Microsoft\Office\{{9.0, 10.0, 11.0, 12.0, 14.0, 16.0}}\Outlook\Security
3. New "String Value" named "Level1Remove"
4. Modify
5. .exe;.com;.vbs;etc.
6. OK and restart Outlook 
```
