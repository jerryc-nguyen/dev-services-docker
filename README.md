### Create volume 
### POSTGRES

- POSTGRES_USER: is the username of PG for first running in container, data stored on volumn
- POSTGRES_PASSWORD: is the password of PG for first running in container, data stored on volumn, we should change after first time initialize


### REDIS
##### Connect to redis host:
```
docker-compose run --rm redis redis-cli -h 192.168.5.178
```
