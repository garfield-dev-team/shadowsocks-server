FROM alpine:latest

RUN apk update && apk add snapd && apk add snapcraft

RUN snap install shadowsocks-libev

ENV SS_SERVER_PORT=8388
ENV SS_PASSWORD=your_password
ENV SS_METHOD=aes-256-gcm

EXPOSE 8388/tcp

CMD ["ss-server", "-p", "${SS_SERVER_PORT}", "-k", "${SS_PASSWORD}", "-m", "${SS_METHOD}"]
