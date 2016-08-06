### Dump
```bash
mongodump --host <db_server> --db <db_name>
```

### Dump to JSON
```bash
mongo --host <db_server> <db_name> -u <username> -p <password> << EOF > out.json
db.File.files.find().pretty()
EOF
```

### Connect
```bash
mongo --host <db_server> <db_name> -u <username> -p <password>
```