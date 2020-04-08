#!/bin/sh

set -e

[ -f /tasks/tasks.cron ] && crontab /tasks/tasks.cron

if [ -n "$*" ]; then
    exec "$@"
else
    exec crond -f -L /dev/stdout
fi
