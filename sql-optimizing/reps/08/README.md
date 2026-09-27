# 08 · Reproduce a lost update

`run.sh` opens two Postgres sessions and runs the SQL in `answer.sql` in both, slightly staggered, against a single remaining seat. From the root of your copy, run `./reps/08/run.sh <connection>` (or `sh reps/08/run.sh <connection>`; the top of `run.sh` shows the way for Postgres in a container). Read `answer.sql` first, then run it and compare with the expected result below.

Expected with the shipped file: `remaining = 0` and `sales = 2`, for a seat that existed once. Change `answer.sql` so the seat is sold once, whichever session gets there first, and a sale only happens when a seat is left. A fixed run reports `remaining = 0` and `sales = 1`.
