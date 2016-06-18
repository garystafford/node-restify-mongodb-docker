## Dockerize Node-Restify-MongoDB RESTful API Example

#### Introduction
Project to my Dockerize the [Node-Restify-MongoDB](https://github.com/garystafford/node-restify-mongodb) GitHub project

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
```
curl -X GET -H "Accept: application/json" "http://localhost:3000/widgets"

npm install -g json
curl -X GET -H "Accept: application/json" "http://localhost:3000/widgets" --silent | json
curl -X GET -H "Accept: application/json" "http://localhost:3000/widgets/SVHXPAWEOD" --silent | json
```

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

