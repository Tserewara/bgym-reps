#!/bin/sh
# Routes eight event keys to one of two shard databases, then counts each.
# Give it both connections:
#
#   ./reps/06/shard.sh postgresql://user:password@localhost:5433/shard_a postgresql://user:password@localhost:5433/shard_b
#
# or, with Postgres in a container and no psql on your machine:
#
#   SHARD_A_PSQL="docker exec -i <container> psql -U <user> -d shard_a" \
#   SHARD_B_PSQL="docker exec -i <container> psql -U <user> -d shard_b" ./reps/06/shard.sh
set -eu

if [ -n "${SHARD_A_PSQL:-}" ] && [ -n "${SHARD_B_PSQL:-}" ]; then
    a="$SHARD_A_PSQL -q -v ON_ERROR_STOP=1"
    b="$SHARD_B_PSQL -q -v ON_ERROR_STOP=1"
elif [ $# -eq 2 ]; then
    a="psql $1 -q -v ON_ERROR_STOP=1"
    b="psql $2 -q -v ON_ERROR_STOP=1"
else
    echo "usage: ./reps/06/shard.sh <shard-a> <shard-b>   (or set SHARD_A_PSQL and SHARD_B_PSQL)" >&2
    exit 2
fi

$a -c 'TRUNCATE routed_events;'
$b -c 'TRUNCATE routed_events;'

route() {
    echo shard-a
}

for key in user-01 user-02 user-03 user-04 user-05 user-06 user-07 user-08; do
    target="$(route "$key")"
    if [ "$target" = shard-a ]; then
        $a -c "INSERT INTO routed_events VALUES ('$key', 'ride');"
    else
        $b -c "INSERT INTO routed_events VALUES ('$key', 'ride');"
    fi
done

echo "shard_a=$($a -At -c 'SELECT count(*) FROM routed_events;')"
echo "shard_b=$($b -At -c 'SELECT count(*) FROM routed_events;')"
