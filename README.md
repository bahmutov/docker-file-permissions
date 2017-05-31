# docker-file-permissions

> Investigating difference in file permissions between root and regular user

This little repo investigates a simple operation.

1. Creates folder "foo"
2. Changes mod on "foo" to "111" (no reading or writing)

Under normal rules, this would prevent anyone from listing the folder "foo".
But under Docker default root user, the folder can still be listed without
problem!

To really make permissions work, need to create a separate user *inside Docker*
image and run the container as that user.

```
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
```

Then when executing inside Docker, the "foo" permissions can be changed, and
trying to list the contents generates an exception.

```
> docker run --name perms -it gleb/docker-file-permissions /bin/bash

person@626835ce7234:~/app$ g st
bash: g: command not found
person@626835ce7234:~/app$ ls
index.js  node_modules  package.json
person@626835ce7234:~/app$ node .
made folder /home/person/app/foo
working with folder /home/person/app/foo
changed folder permissions
d--x--x--x 2 person regular-users 4096 May 31 14:17 /home/person/app/foo
✅ caught permissions exception!
ls: cannot open directory /home/person/app/foo: Permission denied
```

## Run locally

```
npm it
```

## Docker commands

build

```
docker build -t gleb/docker-file-permissions .
```

run

```
docker run --name perms -it gleb/docker-file-permissions /bin/bash
```

stop

```
docker rm perms
```

## Notes
