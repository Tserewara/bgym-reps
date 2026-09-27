# 06 · Judge a routing rule

`reps/06/shard.sh` routes eight event keys to one of two Postgres databases. Read it first, then run it with both shard databases, `./reps/06/shard.sh <shard-a> <shard-b>` from the root of your copy, and compare with the expected result below. Change the rule so keys with an even suffix go to one shard and keys with an odd suffix to the other.

Expected once fixed: `shard_a=4` and `shard_b=4`. The shipped script prints `shard_a=8` and `shard_b=0`.
