FROM alpine:3.13

COPY entrypoint.sh /usr/local/bin/entrypoint

RUN apk add --no-cache --virtual .build-deps \
        gcc \
        python3-dev \
        npm \
        musl-dev && \
    apk add --no-cache \
        py3-pip \
        python3 \
        curl \
        nodejs \
        git \
        chromium \
        youtube-dl \
        ripgrep \
        wget && \
    pip3 install --upgrade pip setuptools && \
    pip3 install --upgrade archivebox && \
    npm install -g 'git+https://github.com/ArchiveBox/ArchiveBox.git' && \
    apk del .build-deps && \
    addgroup --gid 10001 archivebox && \
    adduser \
        --uid 10000 \
        --home /var/lib/archivebox \
        --ingroup archivebox \
        --disabled-password \
        --shell /sbin/nologin \
        archivebox && \
    mkdir -p /data && \
    mkdir -p /var/lib/archivebox/chromium_data/Default && \
    touch /var/lib/archivebox/cookies.txt && \
    chown -R archivebox /data /var/lib/archivebox && \
    chmod +x /usr/local/bin/entrypoint

ENV IN_DOCKER=True \
    CHROME_SANDBOX=False \
    CHROME_BINARY="/usr/bin/chromium-browser" \
    CHROME_USER_DATA_DIR="/var/lib/archivebox/chromium_data" \
    COOKIES_FILE="/var/lib/archivebox/cookies.txt" \
    USE_SINGLEFILE=True \
    SINGLEFILE_BINARY="/usr/bin/single-file" \
    USE_READABILITY=True \
    READABILITY_BINARY="/usr/bin/readability-extractor" \
    USE_MERCURY=True \
    MERCURY_BINARY="/usr/bin/mercury-parser"

VOLUME /data
EXPOSE 8000

WORKDIR /data
USER archivebox
ENTRYPOINT ["/usr/local/bin/entrypoint"]
CMD ["server", "0.0.0.0:8000"]
