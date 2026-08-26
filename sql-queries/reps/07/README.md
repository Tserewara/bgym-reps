# 07 · Read the plan

Find the track titled `Chameleon`. That is a one-line query — write it first.

Then run it again with `EXPLAIN ANALYZE` in front, and read what comes back.

**Expected before:** a plan containing `Seq Scan on tracks`, with a filter on
`title`. Nineteen rows, so it is instant — the number to notice is not the time
but the **method**.

Now add an index on `tracks.title` and run the `EXPLAIN ANALYZE` again.

**Expected after:** on nineteen rows, very possibly *the same sequential scan*.
Postgres is not ignoring your index; it is deciding a scan of nineteen rows is
cheaper than reading an index and then reading the table. Prove that is what is
happening: force the issue with `SET enable_seqscan = off;`, run it once more,
and compare the two plans' costs.

Write in a comment: at roughly what table size would the planner change its
mind on its own, and what would you have to know to answer that properly?

This one is the point of this set. A query plan is the thing you will be
handed by an assistant and asked to approve.
