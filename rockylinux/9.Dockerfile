FROM rockylinux:9

LABEL maintainer='Anton Melekhin'

ENV container=docker

RUN INSTALL_PKGS='findutils initscripts iproute python3 sudo' \
    && dnf makecache && dnf install -y $INSTALL_PKGS \
    && dnf clean all

RUN find /etc/systemd/system \
    /lib/systemd/system \
    -path '*.wants/*' \
    -not -name '*journald*' \
    -not -name '*systemd-tmpfiles*' \
    -not -name '*systemd-user-sessions*' \
    -print0 | xargs -0 rm -vf

VOLUME [ "/sys/fs/cgroup" ]

ENTRYPOINT [ "/usr/sbin/init" ]