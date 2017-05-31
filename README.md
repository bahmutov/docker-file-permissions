# docker-file-permissions

> Investigating difference in file permissions between root and regular user

```
npm install
npm test
```

## Docker commands

build

```
docker build -t gleb/docker-file-permissions .
```

run

```
docker run --name perms -p 6500:6500 -it gleb/docker-file-permissions /bin/bash
```

stop

```
docker rm perms
```

## Notes
