FROM alpine:3.12

RUN apk --no-cache add \
    fcgiwrap \
    spawn-fcgi \
    git-daemon

COPY entrypoint /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint

ENTRYPOINT ["/usr/local/bin/entrypoint"]
CMD "daemon"
