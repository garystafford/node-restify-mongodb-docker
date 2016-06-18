## Dockerize Node-Restify-MongoDB RESTful API Example

#### Introduction
Project to my Dockerize the [Node-Restify-MongoDB](https://github.com/garystafford/node-restify-mongodb) GitHub project

Project's Docker Images
``` text
gstafford@nagstaffo:generator-restify-mongo-docker$ docker images

REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
garystafford/widget           latest              6f47c042e760        41 hours ago        677.8 MB
node                          6.2.1               72d4ec634f1f        2 weeks ago         649.7 MB
mongo                         3.3                 83370cc968c1        3 weeks ago         342.9 MB
```

Project's Docker Containers
``` text
gstafford@nagstaffo:generator-restify-mongo-docker$ docker ps -a

CONTAINER ID        IMAGE                        COMMAND                  CREATED             STATUS                  PORTS                      NAMES
8b0973eace15        garystafford/widget:latest   "node /usr/src/app/ap"   36 minutes ago      Up 20 minutes           0.0.0.0:3000->3000/tcp     widget
1fcd7591dc28        mongo:3.3                    "/entrypoint.sh mongo"   36 minutes ago      Up 21 minutes           0.0.0.0:27018->27017/tcp   mongodb
```

#### Build Project

Build project with Docker
``` bash
docker build -t garystafford/widget .

docker-compose up -d
```

Import sample widget documents into MongoDB
from the Node-Restify-MongoDB project's root directory
``` bash
# import to local development environment db instance
NODE_ENV=development MONGO_PORT=27017 grunt mongoimport --verbose

import to container-based production environment db instance
NODE_ENV=production MONGO_PORT=27018 grunt mongoimport --verbose
```

Test running project
``` bash
curl -X GET -H "Accept: application/json" "http://localhost:3000/widgets"

npm install -g json
curl -X GET -H "Accept: application/json" "http://localhost:3000/widgets" --silent | json
curl -X GET -H "Accept: application/json" "http://localhost:3000/widgets/SVHXPAWEOD" --silent | json
```

#### Other Information
Misc. Docker commands
``` bash
docker logs widget
docker exec -it widget /bin/bash

docker network ls
docker network inspect generatorrestifymongodocker_default

# optional: remove all <none> images
docker rmi $(docker images | grep "^<none>" | awk "{print $3}")

# optional: delete and rebuild project containers
docker rm mongodb --f ; docker rm widget --f; docker-compose up -d
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

# to drop db
use node-restify-mongodb-production
db.dropDatabase()
```

