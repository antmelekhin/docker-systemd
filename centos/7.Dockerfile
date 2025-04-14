FROM centos:7

LABEL maintainer='Anton Melekhin'

ENV container=docker

RUN INSTALL_PKGS='findutils initscripts iproute python sudo' \
    && sed -i 's/mirror.centos.org/vault.centos.org/g' /etc/yum.repos.d/*.repo \
    && sed -i 's/^#.*baseurl=http/baseurl=http/g' /etc/yum.repos.d/*.repo \
    && sed -i 's/^mirrorlist=http/#mirrorlist=http/g' /etc/yum.repos.d/*.repo \
    && yum makecache fast && yum install -y $INSTALL_PKGS \
    \
    && curl --silent 'https://copr.fedorainfracloud.org/coprs/jsynacek/systemd-backports-for-centos-7/repo/epel-7/jsynacek-systemd-backports-for-centos-7-epel-7.repo' --output /etc/yum.repos.d/jsynacek-systemd-centos-7.repo \
    && yum makecache fast && yum update -y \
    && yum clean all

RUN find /etc/systemd/system \
    /lib/systemd/system \
    -path '*.wants/*' \
    -not -name '*journald*' \
    -not -name '*systemd-tmpfiles*' \
    -not -name '*systemd-user-sessions*' \
    -print0 | xargs -0 rm -vf

VOLUME [ "/sys/fs/cgroup" ]

ENTRYPOINT [ "/usr/sbin/init" ]
