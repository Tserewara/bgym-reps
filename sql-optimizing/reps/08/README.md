# 08 · Reproduce a lost update

`run.sh` opens two Postgres sessions and runs the SQL in `answer.sql` in both, slightly staggered, against a single remaining seat. Read the file and predict the final `remaining` and the number of sales before you run it. The shipped version checks, then acts, and leaves a gap in between.

Expected with the shipped file: `remaining = 0` and `sales = 2`, for a seat that existed once. Change `answer.sql` so the read that matters is protected, with `FOR UPDATE` or a suitable isolation level, and so the sale only happens when a seat is left. A fixed run reports `remaining = 0` and `sales = 1`.
