FROM alpine:3.16

RUN addgroup \
        --gid 10001 \
        transmission && \
    adduser \
        --uid 10000 \
        --home /var/lib/transmission \
        --ingroup transmission \
        --disabled-password \
        --shell /sbin/nologin \
        transmission

RUN apk add --no-cache transmission-daemon

RUN mkdir -p \
        /var/lib/transmission/blocklists \
        /var/lib/transmission/downloads \
        /var/lib/transmission/incomplete \
        /var/lib/transmission/resume \
        /var/lib/transmission/torrents && \
    chown -R transmission:transmission /var/lib/transmission

ENV TRANSMISSION_HOME /var/lib/transmission
USER transmission
WORKDIR /var/lib/transmission

CMD ["/usr/bin/transmission-daemon", "--foreground"]
