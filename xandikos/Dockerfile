FROM alpine:3.11

RUN apk add --no-cache \
        git \
        python3 \
        su-exec && \
    apk add --no-cache --virtual .build-deps \
        gcc \
        musl-dev \
        py3-pip \
        python3-dev && \
    pip3 install --upgrade pip && \
    pip3 install \
        aiohttp \
        defusedxml \
        dulwich \
        icalendar \
        jinja2 \
        prometheus-client && \
    apk del .build-deps && \
    mkdir -p /opt && \
    git clone https://github.com/jelmer/xandikos /opt/xandikos && \
    adduser -D -h /var/lib/xandikos xandikos && \
    mkdir -p /var/lib/xandikos/data && \
    chown -R xandikos:xandikos /var/lib/xandikos

COPY entrypoint.sh /entrypoint
RUN chmod +x /entrypoint
ENTRYPOINT ["/entrypoint"]
CMD ["xandikos"]
