# Docker images for running systemd

## Build

```bash
docker build -t systemd-ubuntu:22.04 -f ubuntu/22.04.Dockerfile .
```

## Run

```bash
docker run -d --name systemd-ubuntu --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:rw --cgroupns=host systemd-ubuntu:22.04

docker exec -it systemd-ubuntu /bin/bash
```
