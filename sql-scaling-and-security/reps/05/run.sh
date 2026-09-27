#!/bin/sh
# Sends answer.sql to the primary, counts replication_probe there, then polls
# the replica until the row shows up (five seconds at most). Give it both
# connections:
#
#   ./reps/05/run.sh postgresql://user:password@localhost:5433/bank postgresql://user:password@localhost:5434/bank
#
# or, with Postgres in containers and no psql on your machine:
#
#   PRIMARY_PSQL="docker exec -i <primary> psql -U <user> -d <database>" \
#   REPLICA_PSQL="docker exec -i <replica> psql -U <user> -d <database>" ./reps/05/run.sh
set -eu
cd "$(dirname "$0")"

if [ -n "${PRIMARY_PSQL:-}" ] && [ -n "${REPLICA_PSQL:-}" ]; then
    primary="$PRIMARY_PSQL -q"
    replica="$REPLICA_PSQL -q"
elif [ $# -eq 2 ]; then
    primary="psql $1 -q"
    replica="psql $2 -q"
else
    echo "usage: ./reps/05/run.sh <primary> <replica>   (or set PRIMARY_PSQL and REPLICA_PSQL)" >&2
    exit 2
fi

$primary -v ON_ERROR_STOP=1 < answer.sql
primary_count="$($primary -At -c 'SELECT count(*) FROM replication_probe;')"
replica_count=0
for _ in $(seq 1 25); do
    replica_count="$($replica -At -c 'SELECT count(*) FROM replication_probe;' | tr -d '[:space:]')"
    [ "$replica_count" = "1" ] && break
    sleep 0.2
done
echo "primary=$primary_count replica=$replica_count"
$replica -c "SELECT id, note FROM replication_probe ORDER BY id;"
