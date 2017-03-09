# Minimal Discord Rainbowbot Docker container for Pterodactyl Panel
FROM node:latest

MAINTAINER Alexander Thurman, <it.snake.co.inc@gmail.com>

#Add container user
RUN adduser -D -h /home/container container

#Set container environment
USER container
ENV  HOME /home/container

# Create app directory
RUN mkdir -p /home/container/app
WORKDIR /home/container/app

# Install app dependencies
COPY package.json /home/container/app/
RUN npm install

# Bundle app source
COPY . /home/container/app

#Start the bot
CMD [ "npm", "start" ]
