#!/bin/sh
set -eu

compose="docker compose -f ../../compose.yaml"
a="$compose exec -T shard-a psql -q -v ON_ERROR_STOP=1 -U gym -d gym"
b="$compose exec -T shard-b psql -q -v ON_ERROR_STOP=1 -U gym -d gym"

$a -c 'TRUNCATE routed_events;'
$b -c 'TRUNCATE routed_events;'

route() {
    # Defect: every key follows the same route.
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
