FROM debian:bullseye-slim

ARG TARGETARCH

ENV DOCKER_URL=https://download.docker.com/linux/debian
ENV GPG_FILE=/etc/apt/keyrings/docker.gpg
ENV DEBIAN_VERSION=bullseye

RUN apt-get update && \
    apt-get install -y \
        ca-certificates \
        curl \
        gnupg && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /etc/apt/keyrings && \
    curl -fsSL "$DOCKER_URL/gpg" | gpg --dearmor -o "$GPG_FILE" && \
    echo "deb [arch=$TARGETARCH signed-by=$GPG_FILE] $DOCKER_URL $DEBIAN_VERSION stable" > \
        /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get install -y \
        binfmt-support \
        docker-ce-cli \
        make \
        qemu-user-static && \
    rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
