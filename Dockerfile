FROM alpine
MAINTAINER Matt Jones <matt@starchup.com>

# Install samba utilitys
RUN apk add cifs-utils

COPY samba.sh /usr/bin/


EXPOSE 137/udp 138/udp 139 445

HEALTHCHECK --interval=60s --timeout=15s \
            CMD smbclient -L '\\localhost' -U '%' -m SMB3

VOLUME ["/etc", "/var/cache/samba", "/var/lib/samba", "/var/log/samba",\
            "/run/samba"]

ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/samba.sh"]
