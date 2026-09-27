# 06 · Judge a cleanup

The request was to delete only the two scratch movies, then refresh statistics and reclaim the space. An assistant wrote `answer.sql`. Read it first, then run it and compare with the expected result below. Then load the seed again (the starter's README says how), fix the delete, and run the file again.

Expected once fixed: 499,998 rows remain. The shipped file leaves 499,988. `VACUUM (ANALYZE)` has to run after the delete and outside a transaction block; inside one, Postgres refuses it.
