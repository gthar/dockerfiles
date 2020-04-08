FROM alpine:3.11

RUN apk add --no-cache python3 su-exec && \
    apk add --no-cache --virtual .build-deps py3-pip && \
    pip3 install --upgrade pip && \
    pip3 install vdirsyncer vdirsyncer[google] requests_oauthlib && \
    apk del .build-deps && \
    adduser -D -h /var/lib/vdirsyncer vdirsyncer && \
    mkdir -p /var/lib/vdirsyncer/status /var/lib/vdirsyncer/tokens && \
    touch /var/lib/vdirsyncer/config && \
    chown -R vdirsyncer:vdirsyncer /var/lib/vdirsyncer

COPY crontab /crontab
COPY entrypoint.sh /entrypoint
COPY do_sync.sh /do_sync
RUN chmod +x /entrypoint /do_sync

ENTRYPOINT ["/entrypoint"]
CMD ["task"]

ENV VDIRSYNCER_CONFIG /var/lib/vdirsyncer/config
