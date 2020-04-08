FROM alpine:3.12

RUN apk add --update --no-cache \
        docker-compose \
        docker

COPY entrypoint.sh /entrypoint
RUN chmod +x /entrypoint

ENTRYPOINT ["/entrypoint"]
