FROM alpine:3.13

RUN apk add --no-cache --virtual .build-deps \
        git \
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
    git clone https://github.com/transmission/transmission /usr/local/src/transmission && \
    git -C /usr/local/src/transmission submodule update --init && \
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
        transmission

ENV TRANSMISSION_HOME /var/lib/transmission
USER transmission

CMD ["/usr/local/bin/transmission-daemon", "--foreground"]
