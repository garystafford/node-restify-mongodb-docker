FROM node:6.2.1

MAINTAINER Gary A. Stafford <garystafford@rochester.rr.com>

ENV REFRESHED_AT 2016-06-11
ENV NODE_ENV=production
ENV NODE_HOST=127.0.0.1
ENV NODE_PORT=3001
# based from link in Dockerfile
ENV MONGO_HOST=localhost
ENV MONGO_PORT=27018
ENV LOG_LEVEL=trace

# Create app directory
# RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app
ADD https://github.com/garystafford/node-restify-mongodb/archive/master.zip node-restify-mongodb-master.zip
RUN apt-get update
RUN apt-get install -y zip
RUN unzip -q node-restify-mongodb-master.zip
RUN cp -R node-restify-mongodb-master/* .
RUN rm node-restify-mongodb-master.zip
RUN rm -rf node-restify-mongodb-master
RUN env
RUN ls -al .

# Install app dependencies
RUN npm install --production
RUN pwd
EXPOSE 3001
#CMD [ "npm", "start" ]
CMD [ "node", "/usr/src/app/app.js" ]