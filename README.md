## Dockerize Node-Restify-MongoDB RESTful API Example

#### Introduction
Project to my Dockerize the [Node-Restify-MongoDB](https://github.com/garystafford/node-restify-mongodb) GitHub project

Docker Commands
``` bash
docker build -t garystafford/widget .
docker-compose up -d
docker-compose up -d widget

docker logs garystafford/widget
docker exec -it garystafford/widget /bin/bash env

docker network ls
docker network inspect generatorrestifymongodocker_default
```
Import sample widget documents into MongoDB from Node-Restify-MongoDB project root directory
``` bash
# local development environment db instance
grunt mongoimport

# container-based production environment db instance
export NODE_ENV=production; export MONGO_PORT=27018; grunt mongoimport --verbose
```
View sample widget documents in MongoDB
```
# local development environment db instance
mongo
show dbs
use node-restify-mongodb-development
db.widgets.find()

# container-based production environment db instance
mongo localhost:27018
use node-restify-mongodb-production
db.widgets.find()

# to drop
db.dropDatabase()
```