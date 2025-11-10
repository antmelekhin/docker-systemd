FROM opensuse/leap:16.0

LABEL maintainer='Anton Melekhin'

ENV container=docker

RUN INSTALL_PKGS='findutils iproute2 python3 sudo systemd' \
    && zypper refresh && zypper install -y $INSTALL_PKGS \
    && zypper clean

RUN find /etc/systemd/system \
    /lib/systemd/system \
    -path '*.wants/*' \
    -not -name '*journald*' \
    -not -name '*systemd-tmpfiles*' \
    -not -name '*systemd-user-sessions*' \
    -print0 | xargs -0 rm -vf

VOLUME [ "/sys/fs/cgroup" ]

ENTRYPOINT [ "/usr/sbin/init" ]
