# Docker images for running systemd

## Build

```bash
docker build -t docker-systemd:ubuntu-22.04 -f ubuntu/22.04.Dockerfile .
```

## Run

```bash
docker run -d --name systemd-ubuntu-22.04 --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:rw --cgroupns=host docker-systemd:ubuntu-22.04

docker exec -it systemd-ubuntu-22.04 /bin/bash
```
