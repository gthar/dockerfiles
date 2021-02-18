FROM alpine:3.13

RUN addgroup --gid 10001 tor && \
    adduser \
        --uid 10000 \
        --home /var/lib/tor \
        --ingroup tor \
        --disabled-password \
        --shell /sbin/nologin \
        tor && \
    apk add --no-cache tor

USER tor
CMD tor
