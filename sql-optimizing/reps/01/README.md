# 01 · Read the first plan

Find the exact movie titled `The Quiet Harbor` and put `EXPLAIN (ANALYZE, BUFFERS)` in front of the query. Do not create an index yet.

Expected: one result row inside a plan containing `Seq Scan on movies`, with `actual rows=1`. The table has 500,000 rows, so record the execution time before changing the access path.
