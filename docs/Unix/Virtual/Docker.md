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

### Delete obsolete containers
```bash
# You can add all of this to cron daily
#!/bin/sh
docker rm $(docker ps -aqf status=exited)
docker rmi $(docker images -qf dangling=true)
docker volume rm $(docker volume ls -qf dangling=true)

docker run --rm -e GRACE_PERIOD_SECONDS=86400 -e FORCE_IMAGE_REMOVAL=1 -v /var/run/docker.sock:/var/run/docker.sock spotify/docker-gc
```

