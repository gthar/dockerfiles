#!/bin/sh

set -xe

[ -n "$DOCKER_GID" ] && groupmod -g "${DOCKER_GID}" docker

for algorithm in rsa dsa ecdsa ed25519
do
    keyfile="/etc/ssh/keys/ssh_host_${algorithm}_key"
    [ -f "$keyfile" ] || ssh-keygen -q -N '' -f "$keyfile" -t "$algorithm"
done

BASE_DIR=/var/lib/git

echo "fixing gitolite's permissions..."
find "${BASE_DIR}" \
    -not -path "${BASE_DIR}/.gitolite.rc" \
    -and -not -path "${BASE_DIR}/local/hooks/repo-specific*" \
    -exec chown git:git {} \;

if [ ! -f "${BASE_DIR}/.ssh/authorized_keys" ]
then
    if [ -n "$SSH_KEY" ]
    then
        [ -n "$SSH_KEY_NAME" ] || SSH_KEY_NAME="admin"
	echo "$SSH_KEY" > "/tmp/${SSH_KEY_NAME}.pub"
	echo "gitolite's initial setup"
        su-exec git gitolite setup -pk "/tmp/${SSH_KEY_NAME}.pub"
	rm "/tmp/${SSH_KEY_NAME}.pub"
    else
        echo "SSH_KEY needs to be set"
	exit 1
    fi
else
    # stuff is already set up, but check the setup anyway
    echo "gitolite's sanity setup"
    su-exec git gitolite setup
fi

echo "gitolite is ready,starting sshd"
exec "$@"
