# SQL · Optimizing

`bgym start sql-optimizing` starts a pinned Postgres 16 container and generates 500,000 movie rows, the same rows every time. Nothing gets installed on your machine. Write SQL in `reps/NN/answer.sql`; `bgym run NN` sends it to `psql`. Rep 8 has its own `run.sh`, which opens two sessions at once. `bgym reset` drops the volume and generates the data again.

Finish `sql-viewing` first. You should be comfortable reading a query result, and you'll look up plan and transaction syntax as you go. The reps are about reading what the engine chose, what an index costs, and what two connections can do between one check and the next.

The movie table is big enough that an exact title lookup goes from a sequential scan to an index scan once there's an index to use. The seed also has two movies with nearly the same title, two wallets and a single seat, which is enough to make an over-broad predicate, a half-finished transfer and a lost update show up. The rows come from a generator in `seed/02-data.sql`, not a data dump.

`sql-scaling-and-security` comes after this set.
