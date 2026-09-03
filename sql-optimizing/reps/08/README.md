# 08 · Reproduce a lost update

`run.sh` opens two Postgres sessions and interleaves the SQL in `answer.sql` against one remaining seat. Read that file and predict the final remaining count and sale count before running it. The shipped version has a check-then-act race.

Expected after the shipped file: `remaining = 0` and `sales = 2`, even though only one seat existed. Edit `answer.sql` so the critical read is protected with `FOR UPDATE` or an appropriate isolation level, and make the sale conditional. A corrected run reports `remaining = 0` and `sales = 1`.
