FROM ubuntu
MAINTAINER Matt Jones <matt@starchup.com>

# Install samba utilitys
RUN apt-get update && apt-get install -y \
    cifs-utils


EXPOSE 137/udp 138/udp 139 445


ENTRYPOINT ["/bin/bash"]

