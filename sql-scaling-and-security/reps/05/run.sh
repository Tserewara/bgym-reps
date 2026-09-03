#!/bin/sh
set -eu

compose="docker compose -f ../../compose.yaml"
primary="$compose exec -T primary psql -q -v ON_ERROR_STOP=1 -U gym -d gym"
replica="$compose exec -T replica psql -q -U gym -d gym"

$primary < answer.sql
primary_count="$($primary -At -c 'SELECT count(*) FROM replication_probe;')"
replica_count=0
for _ in $(seq 1 25); do
    replica_count="$($replica -At -c 'SELECT count(*) FROM replication_probe;' | tr -d '[:space:]')"
    [ "$replica_count" = "1" ] && break
    sleep 0.2
done
echo "primary=$primary_count replica=$replica_count"
$replica -c "SELECT id, note FROM replication_probe ORDER BY id;"
