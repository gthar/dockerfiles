# syncthing

FROM alpine:3.13

ARG ARCH
ENV VER v1.17.0
ENV REL syncthing-linux-${ARCH}-${VER}
ENV URI https://github.com/syncthing/syncthing/releases/download/${VER}/${REL}.tar.gz

RUN apk add --no-cache su-exec

RUN adduser -u 1001 -h /var/lib/syncthing -D syncthing && \
    addgroup -S -g 1005 books && addgroup syncthing books && \
    addgroup -S -g 1006 buku  && addgroup syncthing buku

RUN mkdir -p /data && chown -R syncthing:syncthing /data

VOLUME /data /var/lib/syncthing

RUN cd /tmp && \
    wget ${URI} && \
    tar -xzf ${REL}.tar.gz && \
    cp /tmp/${REL}/syncthing /usr/local/bin/syncthing && \
    rm -r /tmp/${REL} /tmp/${REL}.tar.gz

COPY docker-entrypoint.sh /entrypoint

RUN chmod +x /entrypoint
ENTRYPOINT ["/entrypoint"]
CMD ["/usr/local/bin/syncthing", "-home=/var/lib/syncthing"]
