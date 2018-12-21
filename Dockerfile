FROM ubuntu
MAINTAINER Matt Jones <matt@starchup.com>

# Install samba utilitys
RUN apt-get update && apt-get install -y \
    cifs-utils \
    samba \
    shadow \
    tini

EXPOSE 137/udp 138/udp 139 445

VOLUME ["/etc", "/var/cache/samba", "/var/lib/samba", "/var/log/samba",\
            "/run/samba"]
COPY smb.conf /etc/samba/

ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/samba.sh"]

