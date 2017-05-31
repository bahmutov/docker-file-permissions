# FROM cypress/internal:cy-0.19.2
FROM node:6
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY package.json .
RUN npm install
COPY index.js .
