FROM alpine:3.14

ENV VER 3.00

RUN apk add --no-cache --virtual .build-deps \
        curl \
        cmake \
        make \
        gcc \
        g++ \
        musl-dev \
        curl-dev \
        automake \
        autoconf \
        libtool && \
    mkdir -p /usr/local/src && \
    curl -L \
        --output "/usr/local/src/transmission-${VER}.tar.xz" \
        "https://github.com/transmission/transmission-releases/raw/master/transmission-${VER}.tar.xz" && \
    tar -xf "/usr/local/src/tranmission-${VER}.tar.xz" -C /usr/local/src && \
    mkdir -p /usr/local/src/transmission/build && \
    cd /usr/local/src/transmission/build && \
    cmake .. && \
    make && \
    make install && \
    cd / && \
    rm -r /usr/local/src && \
    apk del .build-deps && \
    apk add --no-cache curl

RUN addgroup \
        --gid 10001 \
        transmission && \
    adduser \
        --uid 10000 \
        --home /var/lib/transmission \
        --ingroup transmission \
        --disabled-password \
        --shell /sbin/nologin \
        transmission && \
    mkdir -p \
        /var/lib/transmission/blocklists \
        /var/lib/transmission/downloads \
        /var/lib/transmission/incomplete \
        /var/lib/transmission/resume \
        /var/lib/transmission/torrents && \
    chown -R transmission:transmission /var/lib/transmission

ENV TRANSMISSION_HOME /var/lib/transmission
USER transmission
WORKDIR /var/lib/transmission

CMD ["/usr/local/bin/transmission-daemon", "--foreground"]
