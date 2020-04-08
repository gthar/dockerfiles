# buku

FROM python:3.8-alpine3.11

ENV BUKUSERVER_PORT=5001

RUN apk add --no-cache --virtual .build-deps \
        gcc \
        openssl-dev \
        musl-dev \
        libffi-dev \
        git && \
    mkdir -p /usr/local/src && \
    git clone https://github.com/jarun/buku /usr/local/src/buku && \
    pip install -U --no-cache-dir \
        pip \
        gunicorn \
        "/usr/local/src/buku[server]" && \
    apk del .build-deps && \
    rm -r /usr/local/src

RUN adduser -u 1006 -h /var/lib/buku -D buku && \
    adduser -u 1001 -D syncthing && addgroup syncthing buku && \
    mkdir -p /var/lib/buku/.local/share/buku && \
    chown -R buku:buku /var/lib/buku && \
    chown -R syncthing:buku /var/lib/buku/.local/share/buku && \
    chmod '2775' /var/lib/buku/.local/share/buku && \
    touch /var/lib/buku/.local/share/buku/bookmarks.db && chmod '664' /var/lib/buku/.local/share/buku/bookmarks.db

VOLUME /var/lib/buku/.local/share/buku
EXPOSE ${BUKUSERVER_PORT}

USER buku
ENTRYPOINT gunicorn --bind "0.0.0.0:${BUKUSERVER_PORT}" "bukuserver.server:create_app()"
