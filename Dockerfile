FROM node:6.2.1

MAINTAINER Gary A. Stafford <garystafford@rochester.rr.com>

WORKDIR /usr/src/app

# Install app
ADD https://github.com/garystafford/node-restify-mongodb/archive/master.zip master.zip
RUN apt-get update
RUN apt-get install -y zip
RUN unzip -q master.zip
RUN cp -R node-restify-mongodb-master/* .
RUN rm master.zip
RUN rm -rf node-restify-mongodb-master

# Install app dependencies
RUN npm install --production

CMD [ "node", "/usr/src/app/app.js" ]