# 05 · Read from the replica

In `answer.sql`, insert one row into `replication_probe` with the note `replica check`. `run.sh` sends the file to the primary, counts the rows there, and polls the streaming replica until the row shows up.

Expected: `primary=1 replica=1`, and the replica lists the row with the note `replica check`. The replica may show 0 for a moment before it catches up; reads from a replica can lag, and writes only go to the primary. Running it a second time fails on the primary key, so `bgym reset` before a retry.
