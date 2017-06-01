FROM node:6
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
# Nothing to copy!
# The source code will be mapped at runtime
# COPY package.json .
# RUN npm install
# COPY index.js .
