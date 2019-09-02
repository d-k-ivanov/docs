### Rewind tape drive
```bash
mt -f /dev/st0 rewind
```

### Backup directory
```bash
tar -czvf /dev/st0 /<directory_for_backup>
```

### List files on tape
```bash
tar -tzf /dev/st0
```
### Restore
```bash
mt -f /dev/st0 rewind
tar -xzf /dev/st0 <file_or_dir_to_restore>
```

### Unload
```bash
mt -f /dev/st0 offline
```

### Status
```bash
mt -f /dev/st0 status
```

### Erase
```bash
mt -f /dev/st0 erase
```

### Get position
```bash
mt -f /dev/st0 tell
```

### Moves
```bash
# End
mt -f /dev/nst0 eod
# Previous
mt -f /dev/nst0 bsfm 1
# Next
mt -f /dev/nst0 fsf 1
```

