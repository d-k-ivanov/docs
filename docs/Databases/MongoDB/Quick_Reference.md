
### Quick reference
```bash
help

db.help()

show dbs
show databases
use <db>

show collections
db.<collection>.help()

show users
show roles
show profile

db.collection.find()
db.collection.insert()
db.collection.update()
db.collection.save()
db.collection.remove()
db.collection.drop()
db.collection.createIndex()
db.getSiblingDB()

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