FROM alpine:3.13

RUN apk add --update --no-cache sassc && \
    addgroup \
        --gid 10001 \
        sassc && \
    adduser \
        --uid 10000 \
        --home /data \
        --ingroup sassc \
        --disabled-password \
        --shell /sbin/nologin \
        sassc

WORKDIR /data
USER sassc
ENTRYPOINT ["sassc"]
