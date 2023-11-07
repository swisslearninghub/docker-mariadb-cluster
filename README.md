# Galera Swarm Image



```shell
docker service create \
  --name dbcluster \
  --network net-swarm \
  --replicas=1 \
  --env MYSQL_ROOT_PASSWORD=rootpass \
  --env MYSQL_DATABASE=mydb \
  --env MYSQL_USER=mydbuser \
  --env MYSQL_PASSWORD=mydbpass \
  --env GALERA_USER=galerauser \
  --env GALERA_PASS=galerapass \
  --env MAXSCALE_USER=maxuser \
  --env MAXSCALE_PASS=maxpass \
  --env CLUSTER_NAME=dbcluster \
  --env DB_SERVICE_NAME=dbcluster \
  artifactory.swisslearninghub.com/docker/galera-swarm:latest

docker service ls
docker service ps dbcluster

docker service scale dbcluster=3

docker service create \
  --name maxscale \
  --network net-swarm \
  --env DB_SERVICE_NAME=dbcluster \
  --env ENABLE_ROOT_USER=1 \
  --publish 3306:3306 \
  artifactory.swisslearninghub.com/docker/maxscale-swarm:latest
```
