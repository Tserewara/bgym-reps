# SQL · Optimizing

Half a million movies in PostgreSQL 16, generated the same way every time, plus two wallets and a single cinema seat. You write SQL in `reps/NN/answer.sql`, run it with `psql`, and compare with the expected result printed in the statement. Rep 8 has its own `run.sh`, which opens two sessions at once.

You work in a copy of the set's starter, a repository of your own. Setting up the database is its first task: bring up a Postgres, load `seed/` into it, and check what its README says you should find. How you run Postgres is your call.

Finish `sql-viewing` first. You should be comfortable reading a query result, and you'll look up plan and transaction syntax as you go. The reps are about reading what the engine chose, what an index costs, and what two connections can do between one check and the next.

The movie table is big enough that an exact title lookup goes from a sequential scan to an index scan once there's an index to use. The seed also has two movies with nearly the same title, two scratch rows, two wallets and a single seat. The movies come from a generator in `seed/02-data.sql`.

`sql-scaling-and-security` comes after this set.
