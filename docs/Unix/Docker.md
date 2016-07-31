### Run docker conainer
```
sudo docker run --name mysql-nx -e MYSQL_ROOT_PASSWORD=JuSCY1Bq -d -p 127.0.0.1:3306:3306 mysql:latest
```

### Execute in-docker console
```
sudo docker exec -it <container> bash
```

### Create JSON with container settings
```
docker inspect -f '{{ json .NetworkSettings }}' <container_id> | python -mjson.tool
```

### Delete containers by date
```
docker ps -a | grep 'weeks ago' | awk '{print $1}' | xargs --no-run-if-empty docker rm
```

### Delete all containers:
```
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
```

### Use Docker registry
```
mkdir /etc/systemd/system/docker.service.d/
touch /etc/systemd/system/docker.service.d/docker_opts.conf
nano /etc/systemd/system/docker.service.d/docker_opts.conf

# ---
[Service]
ExecStart=
ExecStart=/usr/bin/docker -d -H fd:// --insecure-registry docker-registry.keepbot.github.io --registry-mirror https://doker-registry-mirror.keepbot.github.io
# ---

systemctl daemon-reload
service docker restart 
```
