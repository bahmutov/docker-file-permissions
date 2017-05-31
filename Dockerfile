FROM node:6

# run as non-root user inside the docker container
# see https://vimeo.com/171803492 at 17:20 mark
RUN groupadd -r regular-users && useradd -m -r -g regular-users person
# now run as the new "non-root" user
USER person

# Now we are restricted to /home folder
RUN mkdir -p /home/person/app
WORKDIR /home/person/app
COPY package.json .
RUN npm install
COPY index.js .
