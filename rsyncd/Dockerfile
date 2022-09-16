FROM alpine:3.16

RUN apk add --no-cache rsync

CMD ["/usr/bin/rsync", "--daemon", "--no-detach", "--config", "/etc/rsyncd.conf"]
