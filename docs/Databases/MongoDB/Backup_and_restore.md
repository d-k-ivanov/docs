### Backup
```bash
# Gzipped archive
mongodump --host "ip_address_or_replicaset:port" --db dataBaseName --gzip --archive=/path/to/archive/file.agz
# BSON Folder
mongodump --host "ip_address_or_replicaset:port" --db dataBaseName --out /path/to/backup/folder
# With oplog
mongodump --host "ip_address_or_replicaset:port" --oplog --gzip --archive=/path/to/archive/file.agz
mongodump --host "ip_address_or_replicaset:port" --oplog --out /path/to/backup/folder
```

### Restore
```bash
# Gzipped archive
mongorestore --host "ip_address_or_replicaset:port" --db dataBaseName --drop --gzip --archive=/path/to/archive/file.agz
# BSON Folder
mongorestore --host "ip_address_or_replicaset:port" --db dataBaseName --drop /path/to/backup/folder
# With oplog
mongorestore --host "ip_address_or_replicaset:port" --oplogReplay --drop --gzip --archive=/path/to/archive/file.agz
mongorestore --host "ip_address_or_replicaset:port" --oplogReplay --drop /path/to/backup/folder

```