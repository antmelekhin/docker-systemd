# Docker images with systemd support

Docker containers that uses for Ansible role and playbook testing.

## Supported tags and platforms

Amazon Linux:

- `amazonlinux-2023` (`linux/amd64`,`linux/arm64`)

CentOS:

- `centos-7` (`linux/amd64`)

Debian:

- `debian-10` (`linux/amd64`,`linux/arm64`)
- `debian-11` (`linux/amd64`,`linux/arm64`)
- `debian-12` (`linux/amd64`,`linux/arm64`)

Rocky Linux:

- `rockylinux-8` (`linux/amd64`,`linux/arm64`)
- `rockylinux-9` (`linux/amd64`,`linux/arm64`)

Ubuntu:

- `ubuntu-20.04` (`linux/amd64`,`linux/arm64`)
- `ubuntu-22.04` (`linux/amd64`,`linux/arm64`)

## Usage

```yaml
---
dependency:
  name: galaxy
  enabled: true
driver:
  name: docker
lint: |
  set -e
  yamllint .
  ansible-lint
platforms:
  - name: 'instance-ubuntu'
    image: 'antmelekhin/docker-systemd:ubuntu-22.04'
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:rw
      - /var/lib/containerd
    cgroupns_mode: host
    privileged: true
    pre_build_image: true
    groups:
      - debian_family
  - name: 'instance-rocky'
    image: 'antmelekhin/docker-systemd:rockylinux-9'
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:rw
      - /var/lib/containerd
    cgroupns_mode: host
    privileged: true
    pre_build_image: true
    groups:
      - rhel_family
provisioner:
  name: ansible
verifier:
  name: ansible
```

## License

MIT

## Author

Melekhin Anton.
