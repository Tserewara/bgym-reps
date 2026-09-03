# 06 · Judge vacuum timing

The request was to remove only the two scratch movies, then refresh statistics and reclaim space. `answer.sql` is assistant-written. Predict the remaining row count, read its delete predicate, and run it. Then narrow the delete and rerun the maintenance commands.

Expected if it were right: 499,998 rows remain. The shipped file returns 499,988 because `id <= 12` deletes ten real movies along with the two scratch rows. `VACUUM (ANALYZE)` must run after the delete, outside a transaction.
