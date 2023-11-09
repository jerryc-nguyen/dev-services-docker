### Create volume

### POSTGRES

- POSTGRES_USER: is the username of PG for first running in container, data stored on volumn
- POSTGRES_PASSWORD: is the password of PG for first running in container, data stored on volumn, we should change after first time initialize

### REDIS

##### Connect to redis host:

```
docker-compose run --rm redis redis-cli -h 192.168.5.178
```

## BUILD ES 5.6 run on Apple Silicon Chip

https://www.appsloveworld.com/docker/100/19/how-to-run-elasticsearch-6-on-an-apple-silicon-mac
https://stackoverflow.com/questions/72717414/how-to-run-elasticsearch-v6-on-m1-arm-inside-docker

docker build -t elasticsearch_56 .

docker run -p 9200:9200 elasticsearch_56
