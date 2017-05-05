### Backup
```bash
# Gzipped archive
mongodump --host "ip_address_or_replicaset:port" --db dataBaseName --gzip --archive=/path/to/archive/file.agz
# BSON Folder
mongodump --host "ip_address_or_replicaset:port" --db dataBaseName --out /path/to/backup/folder
```

### Restore
```bash
# Gzipped archive
mongorestore --host "ip_address_or_replicaset:port" --db dataBaseName --drop --gzip --archive=/path/to/archive/file.agz
# BSON Folder
mongorestore --host "ip_address_or_replicaset:port" --db dataBaseName --drop /path/to/backup/folder
```