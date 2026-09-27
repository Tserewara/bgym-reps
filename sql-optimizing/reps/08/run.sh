#!/bin/sh
# Runs answer.sql in two Postgres sessions at once, the second 0.15s after the
# first, against a seat reset to one. Give it your connection:
#
#   ./run.sh postgresql://user:password@localhost:5433/movies
#
# or, with Postgres in a container and no psql on your machine:
#
#   PSQL="docker exec -i <container> psql -U <user> -d <database>" ./run.sh
set -eu
cd "$(dirname "$0")"

if [ -n "${PSQL:-}" ]; then
    db="$PSQL -q -v ON_ERROR_STOP=1"
elif [ $# -eq 1 ]; then
    db="psql $1 -q -v ON_ERROR_STOP=1"
else
    echo "usage: ./run.sh <connection>   (or set PSQL, see the top of this file)" >&2
    exit 2
fi

$db -c "UPDATE seats SET remaining = 1 WHERE id = 1; TRUNCATE seat_sales RESTART IDENTITY;"
tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT

$db < answer.sql > "$tmp/one.out" & one=$!
sleep 0.15
$db < answer.sql > "$tmp/two.out" & two=$!
wait "$one"
wait "$two"

cat "$tmp/one.out" "$tmp/two.out"
$db -c "SELECT remaining, (SELECT count(*) FROM seat_sales) AS sales FROM seats WHERE id = 1;"
