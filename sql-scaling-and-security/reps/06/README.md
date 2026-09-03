# 06 · Judge a shard hotspot

`reps/06/shard.sh` routes eight event keys to one of two Postgres databases. Read its route function and predict the two row counts before running it. Then change the hand-written rule so even and odd suffixes are split between the two shards.

Expected if it were right: shard A has 4 rows and shard B has 4 rows. The shipped script sends all 8 to shard A, creating an avoidable hotspot. Sharding distributes storage and requests, but a bad shard key only moves the bottleneck.
