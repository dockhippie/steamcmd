FROM webhippie/opensuse:latest
MAINTAINER Thomas Boerger <thomas@webhippie.de>

RUN groupadd -r steam && \
  useradd -m -r -d /var/lib/steam -g steam steam && \
  zypper -n install -l --no-recommends \
    tar \
    wget \
    glibc-32bit \
    libstdc++6-32bit && \
  cd /var/lib/steam && \
  wget -O - http://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz | tar -xzf - && \
  chown -R steam:steam /var/lib/steam

ADD rootfs /
CMD ["bash"]
