FROM golang:1.16.3-alpine3.13 AS builder

RUN apk --no-cache add git build-base && \
    mkdir -p /build && \
    git clone https://github.com/matrix-org/dendrite /build/dendrite && \
    mkdir -p /build/bin && \
    cd /build/dendrite && \
    go build -trimpath -o /build/bin/ ./cmd/dendrite-monolith-server && \
    go build -trimpath -o /build/bin/ ./cmd/goose && \
    go build -trimpath -o /build/bin/ ./cmd/create-account && \
    go build -trimpath -o /build/bin/ ./cmd/generate-keys

FROM alpine:3.13

COPY --from=builder /build/bin/* /usr/local/bin/
COPY entrypoint.sh /usr/local/bin/entrypoint

RUN chmod +x /usr/local/bin/entrypoint && \
    addgroup --gid 10001 dendrite && \
    adduser \
        --uid 10000 \
        --home /var/lib/dendrite \
        --ingroup dendrite \
        --disabled-password \
        --shell /sbin/nologin \
        dendrite && \
    mkdir -p /var/log/dendrite /var/dendrite/media && \
    chown -R dendrite:dendrite /var/log/dendrite /var/dendrite

WORKDIR /etc/dendrite
USER dendrite

ENTRYPOINT ["/usr/local/bin/entrypoint"]
