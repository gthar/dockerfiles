#!/bin/sh

gosu ledger /home/ledger/ledger-web/manage.py makemigrations && \
gosu ledger /home/ledger/ledger-web/manage.py migrate

exec gosu ledger "$@"
