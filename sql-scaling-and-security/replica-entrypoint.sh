#!/bin/sh
set -eu

data="${PGDATA:-/var/lib/postgresql/data}"
if [ ! -s "$data/PG_VERSION" ]; then
    until pg_isready -h primary -U gym; do sleep 1; done
    mkdir -p "$data"
    chown postgres:postgres "$data"
    PGPASSWORD=replicator pg_basebackup -h primary -D "$data" -U replicator -Fp -Xs -P
    printf "primary_conninfo = 'host=primary port=5432 user=replicator password=replicator application_name=replica'\n" > "$data/postgresql.auto.conf"
    touch "$data/standby.signal"
    chown postgres:postgres "$data/postgresql.auto.conf" "$data/standby.signal"
fi

exec docker-entrypoint.sh postgres -c hot_standby=on
