#!/bin/sh

NTHREADS=${NTHREADS:=1}

stop () {
    echo "un-exporting filesystems"
    /usr/sbin/exportfs -uav

    echo "terminating nfsd"
    /usr/sbin/rpc.nfsd 0

    echo "killing pids"
    pid1=$(pidof rpc.nfsd)
    pid2=$(pidof rpc.mountd)
    pid3=$(pidof rpc.rpcbind)
    kill -TERM "$pid1" "$pid2" "$pid3"

    echo "un-mounting /var/lib/nfs/rpc_pipefs"
    umount /var/lib/nfs/rpc_pipefs

    echo "un-mounting /proc/nfs/nfsd"
    umount /proc/fs/nfsd

    exit 0
}

boot () {

    echo "mounting /var/lib/nfs/rpc_pipefs"
    /bin/mount -t rpc_pipefs /var/lib/nfs/rpc_pipefs
    echo "mounting /proc/fs/nfsd"
    /bin/mount -t nfsd /proc/fs/nfsd

    echo "starting rpcbind"
    /sbin/rpcbind -sw
    /sbin/rpcinfo

    echo "exporting filesystems"
    /usr/sbin/exportfs -ar
    cat /etc/exports

    echo "starting mountd"
    /usr/sbin/rpc.mountd \
        --port 32767 \
        --nfs-version 4 \
        --no-nfs-version 2 \
        --no-nfs-version 3

    echo "starting nfsd"
    /usr/sbin/rpc.nfsd \
        --tcp \
        --udp \
        --port 2049 \
        --nfs-version 4 \
        --no-nfs-version 2 \
        --no-nfs-version 3 \
        "${NTHREADS}"

    echo "terminating rpcbind"
    pid=$(pidof rpcbind)
    [ -n "$pid" ] && kill "$pid"

    echo "ready"
}

trap stop TERM INT
boot

while :; do
    sleep 2073600 &
    wait
done
