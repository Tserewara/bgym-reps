# 01 · Read the first plan

Find the movie titled exactly `The Quiet Harbor`, with `EXPLAIN (ANALYZE, BUFFERS)` in front of the query. Don't create an index yet.

Expected: a `Parallel Seq Scan on movies` under a `Gather` node (a plain `Seq Scan` if parallel workers are off). The `Gather` line reports `rows=1`; with two workers, the scan node shows `rows=0 loops=3`. Write down the execution time. You'll compare it in rep 2.
