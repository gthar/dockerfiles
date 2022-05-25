# syncthing

FROM alpine:3.15

ARG TARGETPLATFORM
ENV VERSION v1.20.1

RUN addgroup --gid 10001 syncthing && \
    adduser \
        --uid 10000 \
        --home /var/lib/syncthing \
        --ingroup syncthing \
        --disabled-password \
        --shell /sbin/nologin \
        syncthing && \
    mkdir -p /data && chown -R syncthing:syncthing /data && \
    cd /tmp && \
    ARCH=$(echo "$TARGETPLATFORM" | sed 's/\//-/') && \
    RELEASE="syncthing-${ARCH}-${VERSION}" && \
    URI="https://github.com/syncthing/syncthing/releases/download/${VERSION}/${RELEASE}.tar.gz" && \
    echo "$URI" && \
    wget "${URI}" && \
    tar -xzf "${RELEASE}.tar.gz" && \
    cp "/tmp/${RELEASE}/syncthing" /usr/local/bin/syncthing && \
    rm -r "/tmp/${RELEASE}" "/tmp/${RELEASE}.tar.gz"

VOLUME /data /var/lib/syncthing
USER syncthing
CMD ["/usr/local/bin/syncthing", "-home=/var/lib/syncthing"]
