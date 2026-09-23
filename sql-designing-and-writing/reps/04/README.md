# 04 · Import through staging

Inside a transaction, create a temporary staging table, load two station rows into it with `COPY`, and insert them into `stations` with their names trimmed. Return the new station IDs and names, then roll back so the seed is intact for the next rep.

Expected: 2 rows, with no leading or trailing spaces in the names. After the rollback, neither station exists.
