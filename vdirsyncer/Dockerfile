FROM alpine:3.13

RUN apk add --no-cache python3 py3-pip su-exec && \
    pip3 install --upgrade pip && \
    pip3 install vdirsyncer vdirsyncer[google] requests_oauthlib && \
    addgroup --gid 10001 vdirsyncer && \
    adduser \
        --empty-password \
        --home /var/lib/vdirsyncer \
        --uid 10000 \
        --ingroup vdirsyncer \
        vdirsyncer && \
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
