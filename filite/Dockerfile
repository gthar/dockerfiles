FROM alpine:3.13

RUN apk add --no-cache --virtual .build-deps cargo && \
    apk add --no-cache libgcc && \
    cargo install filite && \
    apk del .build-deps && \
    mv /root/.cargo/bin/filite /usr/local/bin/filite && \
    rm -r /root/.cargo && \
    addgroup \
        --gid 10001 \
        filite && \
    adduser \
        --uid 10000 \
        --home /var/lib/filite \
        --ingroup filite \
        --disabled-password \
        --shell /sbin/nologin \
        filite

WORKDIR /var/lib/filite
USER filite
ENTRYPOINT ["/usr/local/bin/filite"]
