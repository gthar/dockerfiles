FROM alpine:3.13

COPY entrypoint.sh /usr/local/bin/entrypoint

RUN apk add --no-cache nfs-utils && \
    rm /etc/idmapd.conf /etc/exports && \
    mkdir -p /var/lib/nfs/rpc_pipefs /var/lib/nfs/v4recovery && \
    echo "rpc_pipefs  /var/lib/nfs/rpc_pipefs  rpc_pipefs  defaults  0  0" >> /etc/fstab && \
    echo "nfsd        /proc/fs/nfsd            nfsd        defaults  0  0" >> /etc/fstab && \
    chmod +x /usr/local/bin/entrypoint

EXPOSE 2049
ENTRYPOINT ["/usr/local/bin/entrypoint"]


