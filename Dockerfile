FROM node:6.2.1

MAINTAINER Gary A. Stafford <garystafford@rochester.rr.com>

WORKDIR /usr/src/app

ADD https://github.com/garystafford/node-restify-mongodb/archive/master.zip master.zip

RUN apt-get update -yq && \
    # apt-get upgrade -yq && \
    apt-get install -y zip && \
    unzip -q master.zip && \
    cp -R node-restify-mongodb-master/* . && \
    rm master.zip && \
    rm -rf node-restify-mongodb-master && \
    npm install --production

CMD [ "node", "/usr/src/app/app.js" ]