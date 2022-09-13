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

SSH_KEY_CERT="${SSH_KEY_CERT:-${PLUGIN_KEY_CERT}}"

KNOWN_HOSTS="${KNOWN_HOSTS:=${PLUGIN_KNOWN_HOSTS}}"

SOURCES="${SOURCES:-${PLUGIN_SOURCES}}"
SOURCES=$(echo "$SOURCES" | tr ',' ' ')
if [ -z "$SOURCES" ]; then
    echo "specify at least one source"
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
keyfile="$HOME/.ssh/user_key"
echo "$SSH_KEY" > "$keyfile"
chmod 0600 "$keyfile"

echo 'Host *' > "$HOME/.ssh/config"
echo "  IdentityFile $keyfile" >> "$HOME/.ssh/config"

if [ -n "${SSH_KEY_CERT}" ]; then
    certfile="$HOME/.ssh/user_key-cert.pub"
    echo "${SSH_KEY_CERT}" > "$certfile"
    echo "  CertificateFile $certfile" >> "$HOME/.ssh/config"
fi

known_hosts_file="${HOME}/.ssh/known_hosts"
[ -n "${KNOWN_HOSTS}" ] && echo "${KNOWN_HOSTS}" >> "$known_hosts_file"
[ -f "${known_hosts_file}" ] && chmod 0600 "$known_hosts_file"

# run rsync

# shellcheck disable=SC2086
for SOURCE in $SOURCES; do
    echo "copying '$SOURCE' to '$TARGET'"
    rsync $ARGS "${SOURCE}" "${USER}"@"${HOST}":"${TARGET}"
done
