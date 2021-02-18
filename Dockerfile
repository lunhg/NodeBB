FROM node:lts-alpine

RUN mkdir -p /var/www
WORKDIR /var/www

RUN apk update && apk add --no-cache git && rm -rf /var/cache/apk/*

COPY install/package.json /var/www/package.json

RUN npm install --only=$NODE_ENV && \
    npm cache clean --force
    
COPY . /var/www

EXPOSE 4567

CMD node ./nodebb build && node ./nodebb start
