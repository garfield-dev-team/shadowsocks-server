FROM ubuntu:latest

RUN DEBIAN_FRONTEND=noninteractive \
    && apt-get update  \
    && apt-get -y install shadowsocks-libev \

RUN mkdir -p ~/build-area/  \
    && cp ./scripts/build_deb.sh ~/build-area/ \
    && cd ~/build-area \
    && ./build_deb.sh

ENV SS_SERVER_PORT=8388
ENV SS_PASSWORD=your_password
ENV SS_METHOD=aes-256-gcm

EXPOSE 8388/tcp

CMD ["ss-server", "-p", "${SS_SERVER_PORT}", "-k", "${SS_PASSWORD}", "-m", "${SS_METHOD}"]
