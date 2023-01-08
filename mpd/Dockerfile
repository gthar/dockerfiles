FROM alpine:3.17

RUN mkdir -p /var/lib/mpd && \
    addgroup --gid 10001 mpd && \
    adduser \
        --uid 10000 \
        --home /var/lib/mpd \
        --ingroup mpd \
        --disabled-password \
        --shell /sbin/nologin \
        mpd && \
    chown -R mpd /var/lib/mpd && \
    apk add --no-cache mpd

USER mpd
CMD ["/usr/bin/mpd", "--no-daemon"]
