# 06 · Judge a shard hotspot

`reps/06/shard.sh` routes eight event keys to one of two Postgres databases. Read its `route` function and predict both row counts before you run it. Then change the rule so keys with an even suffix go to one shard and keys with an odd suffix to the other.

Expected once fixed: `shard_a=4` and `shard_b=4`. The shipped script prints `shard_a=8` and `shard_b=0`: every key lands on shard A, and the second server does nothing. Sharding spreads data and load only as well as the routing rule does.
