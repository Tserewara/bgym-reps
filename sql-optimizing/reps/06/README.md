# 06 · Judge vacuum timing

The request was to delete only the two scratch movies, then refresh statistics and reclaim the space. An assistant wrote `answer.sql`. Predict how many rows will be left, read its delete predicate, and run it. Then `bgym reset`, narrow the delete, and run the file again.

Expected once fixed: 499,998 rows remain. The shipped file leaves 499,988, because `id <= 12` deletes ten real movies along with the two scratch rows. `VACUUM (ANALYZE)` has to run after the delete and outside a transaction block; inside one, Postgres refuses it.
