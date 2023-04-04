FROM shadowsocks-libev:latest

RUN apk update

ENV SS_SERVER_PORT=8388
ENV SS_PASSWORD=your_password
ENV SS_METHOD=aes-256-gcm

EXPOSE 8388/tcp

CMD ["ss-server", "-p", "${SS_SERVER_PORT}", "-k", "${SS_PASSWORD}", "-m", "${SS_METHOD}"]
