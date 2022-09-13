#!/bin/sh

set -e

# check settings

HOST="${HOST:-${PLUGIN_HOST}}"
if [ -z "$HOST" ]; then
    echo "'host' must be specified"
    exit 1
fi

USER="${USER:-${PLUGIN_USER:-root}}"
PORT="${PORT:-${PLUGIN_PORT:-22}}"

SSH_KEY="${SSH_KEY:-${PLUGIN_KEY}}"
if [ -z "$SSH_KEY" ]; then
    echo "ssh_key must be specified"
    exit 1
fi

SSH_KEY_CERT="${SSH_KEY_CERT:-${PLUGIN_KEY_CERT}}"

KNOWN_HOSTS="${KNOWN_HOSTS:=${PLUGIN_KNOWN_HOSTS}}"

COMMANDS="${COMMANDS:-${PLUGIN_COMMANDS}}"
if [ -z "$COMMANDS" ]; then
    echo "specify at least one command to run"
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

# run commands

IFS=","
for COMMAND in $COMMANDS; do
    echo "running '$COMMAND' remotely"
    # shellcheck disable=SC2086,SC2029
    ssh -p "${PORT}" $ARGS "$USER"@"${HOST}" "$COMMAND"
done
