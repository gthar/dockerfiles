#!/bin/sh

set -xe

[ -n "${USER_ID}" ] && usermod -u "${USER_ID}" tor

for dir in $(awk '{if ($1 == "HiddenServiceDir") print $2}' /etc/tor/torrc)
do
    mkdir -p "${dir}"
    chown tor "${dir}"
    chmod 700 "${dir}"
done

su-exec tor "$@"
