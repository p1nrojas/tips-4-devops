## Kill old containers

```
docker ps -a | grep 'weeks ago' | awk '{print $1}' | xargs docker rm
```

## Kill running containers

```
docker kill $(docker ps -q)
```

## Delete dangling images
```
docker rmi $(docker images -q -f dangling=true)
```

## Delete all images
```
docker rmi $(docker images -q)
```

### Monitor system resource utilization for running containers

To check the CPU, memory, and network I/O usage of a single container, you can use:

```
docker stats <container>
```

For all containers listed by id:

```
docker stats $(docker ps -q)
```

For all containers listed by name:

```
docker stats $(docker ps --format '{{.Names}}')
```

For all containers listed by image:

```
docker ps -a -f ancestor=ubuntu
```

Remove all untagged images
```
docker rmi $(docker images | grep “^” | awk “{print $3}”)
```

Remove container by a regular expression
```
docker ps -a | grep wildfly | awk '{print $1}' | xargs docker rm -f
```
Remove all exited containers
```
docker rm -f $(docker ps -a | grep Exit | awk '{ print $1 }')
```
