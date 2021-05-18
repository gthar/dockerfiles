FROM debian:buster-slim

ARG ARCH
ENV VER v0.17.2.0
ENV URL "https://downloads.getmonero.org/cli/monero-linux-${ARCH}-${VER}.tar.bz2"

RUN apt-get update && \
    apt-get install -y curl bzip2 && \
    rm -rf /var/lib/apt/lists/* && \
    curl -o /root/monero.tar.bz2 "${URL}" && \
    bzip2 -d /root/monero.tar.bz2 && \
    tar -C /root -xf /root/monero.tar && \
    find /root -type f -executable -exec cp {} /usr/local/bin \; && \
    rm -r /root/monero*

RUN groupadd --gid 10001 monero && \
    useradd \
        --uid 10000 \
        --gid 10001 \
        --shell /sbin/nologin \
        --create-home \
        --home-dir /var/lib/monero \
        monero

USER monero
WORKDIR /var/lib/monero
