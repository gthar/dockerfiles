FROM alpine:3.16

RUN apk add --no-cache --virtual .build-deps cargo && \
    apk add --no-cache libgcc && \
    cargo install agate && \
    apk del .build-deps && \
    mv /root/.cargo/bin/agate /usr/local/bin/agate && \
    addgroup \
        --gid 10001 \
        agate && \
    adduser \
        --uid 10000 \
        --home /srv \
        --ingroup agate \
        --disabled-password \
        --shell /sbin/nologin \
        agate

WORKDIR /srv
USER agate
ENTRYPOINT ["agate"]
