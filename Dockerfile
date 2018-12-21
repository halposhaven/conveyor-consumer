FROM ubuntu:latest
MAINTAINER Matt Jones <matt@starchup.com>

# Install samba utilitys
RUN apt-get update && apt-get install -y \
    cifs-utils \
    samba \

EXPOSE 137/udp 138/udp 139 445

VOLUME ["/etc", "/var/cache/samba", "/var/lib/samba", "/var/log/samba",\
            "/run/samba"]
COPY smb.conf /etc/samba/

ENTRYPOINT ["/etc/init.d/", "--", "/usr/bin/samba.sh"]

