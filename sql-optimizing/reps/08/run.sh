#!/bin/sh
set -eu

compose="docker compose -f ../../compose.yaml"
db="$compose exec -T db psql -q -v ON_ERROR_STOP=1 -U gym -d gym"

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
