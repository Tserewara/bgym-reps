# 04 · Import through staging

Inside a transaction, create a temporary CSV staging table, load two station rows with `COPY`, and insert them into `stations` with trimmed names. Return the inserted station IDs and names, then roll back so the seed remains available to the next rep.

Expected: 2 rows. The imported names have no leading or trailing spaces, and no permanent station remains after the statement finishes.
