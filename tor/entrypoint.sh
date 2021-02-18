#!/bin/sh

set -xe

if [ -f /etc/tor/torrc ]
then
    awk '{if ($1 == "HiddenServiceDir") print $2}' /etc/tor/torrc | while IFS= read -r dir
    do
        mkdir -p "${dir}"
        chown tor "${dir}"
        chmod 700 "${dir}"
    done
fi

su-exec tor "$@"
