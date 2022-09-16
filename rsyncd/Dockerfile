FROM alpine:3.16

COPY entrypoint.sh /entrypoint.sh 

RUN chmod +x /entrypoint.sh && \
    apk add --no-cache rsync

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/rsync", "--daemon", "--no-detach", "--config", "/etc/rsyncd.conf", "--verbose"]
