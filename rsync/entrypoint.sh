#!/bin/sh

set -e

# check settings

HOST="${HOST:-${PLUGIN_HOST}}"
if [ -z "$HOST" ]; then
    echo "'host' must be specified"
    exit 1
fi

USER="${USER:-${PLUGIN_USER:-root}}"

SSH_KEY="${SSH_KEY:-${PLUGIN_KEY}}"
if [ -z "$SSH_KEY" ]; then
    echo "ssh_key must be specified"
    exit 1
fi

KNOWN_HOSTS="${KNOWN_HOSTS:=${PLUGIN_KNOWN_HOSTS}}"

SOURCE="${SOURCE:-${PLUGIN_SOURCE}}"
if [ -z "$SOURCE" ]; then
    echo "'source' must be specified"
    exit 1
fi

TARGET="${TARGET:-${PLUGIN_TARGET}}"
if [ -z "$TARGET" ]; then
    echo "'target' must be specified"
    exit 1
fi

ARGS=${ARGS:-${PLUGIN_ARGS}}

# prepare SSH

mkdir -p "$HOME/.ssh"
keyfile="$HOME/.ssh/id_rsa"
echo "$SSH_KEY" > "$keyfile"
chmod 0600 "$keyfile"

known_hosts_file="${HOME}/.ssh/known_hosts"
[ -n "${KNOWN_HOSTS}" ] && echo "${KNOWN_HOSTS}" >> "$known_hosts_file"
[ -f "${known_hosts_file}" ] && chmod 0600 "$known_hosts_file"

# run rsync

# shellcheck disable=SC2086
exec rsync $ARGS "${SOURCE}" "${USER}"@"${HOST}":"${TARGET}"
