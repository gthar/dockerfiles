FROM elixir:1.11.3-alpine as build

ENV MIX_ENV=prod

RUN apk add \
        git \
        gcc \
        g++ \
        musl-dev \
        make \
        cmake \
        file-dev && \
    git clone \
        -b develop \
        https://git.pleroma.social/pleroma/pleroma.git \
        /pleroma && \
    echo "import Mix.Config" > /pleroma/config/prod.secret.exs && \
    cd /pleroma && \
    mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get --only prod && \
    mkdir -p /pleroma/release && \
    mix release --path release

FROM alpine:3.13

RUN apk add --update --no-cache \
        exiftool \
        imagemagick \
        libmagic \
        ncurses \
        postgresql-client && \
    addgroup \
        --gid 10001 \
        pleroma && \
    adduser \
        --system \
        --shell /bin/false \
        --home /opt/pleroma \
        --uid 10000 \
        --ingroup pleroma \
        pleroma && \
    mkdir -p /var/lib/pleroma/uploads && \
    mkdir -p /var/lib/pleroma/static && \
    chown -R pleroma /var/lib/pleroma && \
    mkdir -p /etc/pleroma && \
    chown -R pleroma /etc/pleroma

ENV PATH=/opt/pleroma/bin:$PATH

COPY entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint

USER pleroma

COPY --from=build --chown=pleroma:0 /pleroma/release /opt/pleroma

ENTRYPOINT ["/usr/local/bin/entrypoint"]
CMD ["/opt/pleroma/bin/pleroma", "start"]
