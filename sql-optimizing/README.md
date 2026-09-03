# SQL · Optimizing

`bgym start sql-optimizing` brings up a pinned Postgres 16 container and generates 500,000 deterministic movie rows in the seed. Nothing is installed on your machine. Write SQL in `reps/NN/answer.sql`; `bgym run NN` sends it to `psql`. Rep 8 has its own `run.sh` and a two-session fixture. `bgym reset` removes the volume and regenerates the data.

You should have finished `sql-viewing` and be comfortable reading a query result. This set assumes you can look up plan and transaction syntax. The work is to read what the engine chose, what an index costs, and what two connections can do between one check and the next.

The movie table is large enough for a selective title lookup to change from a sequential scan to an index scan. The seed also contains two similarly named movies, two wallet balances and one seat, so a broad predicate, a half-transaction or a lost update is visible. The row generator is a script in `seed/02-data.sql`, not a checked-in data dump.

Do `sql-viewing` before this set. Do `sql-scaling-and-security` after it.
