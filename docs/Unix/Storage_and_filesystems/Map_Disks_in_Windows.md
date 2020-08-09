### Map local folder to drive letter

```bash
subst <drive_letter:> <path_to_local_folder>
#subst U: d:\AdminTools
```

### Map reemote folder within domain

```bash
net use <DriveLetter>: \\Server\SharedFolder /USER:<username>@<domain> * /PERSISTENT:YES
# net use U: \\FileServer\HomeFolder /USER:Administrator@example.ru * /PERSISTENT:YES
```
