FROM node:15-alpine3.13
# Create app directory
WORKDIR /usr/src/app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY ./package*.json ./
# COPY deamon.json /etc/docker/daemon.json
RUN apk add dumb-init
RUN rm -rf /var/cache/apk/*

ENV NODE_ENV production
#runthis for dev
#RUN npm install

# If you are building your code for production
RUN npm ci --only=production
COPY ./ .
EXPOSE 80

CMD ["dumb-init", "node", "server.js"]
#CMD [ "node", "./server.js" ]
#docker build -t next-dominikhaid .
#docker run --name dev-server -p 80:80 dev-server/node
