FROM alpine:3.16

COPY entrypoint.sh /entrypoint

RUN chmod +x /entrypoint && \
    apk add --no-cache \
        openssh-client \
        rsync

ENTRYPOINT ["/entrypoint"]
