#!/bin/ash

set -e

DB_USER="${DB_USER:-pleroma}"
DB_HOST="${DB_HOST:-db}"
DB_NAME="${DB_NAME:-pleroma}"

echo "-- Waiting for database..."
while ! pg_isready -U "${DB_USER}" -d "postgres://${DB_HOST}:5432/${DB_NAME}" -t 1; do
    sleep 1s
done

echo "-- Running migrations..."
/opt/pleroma/bin/pleroma_ctl migrate

echo "-- Starting!"
exec "$@"
