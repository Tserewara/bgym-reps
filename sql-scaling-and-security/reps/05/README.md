# 05 · Read from the replica

In `answer.sql`, insert one row into `replication_probe`, with the ID `1` and the note `replica check`. `run.sh` sends the file to the primary, counts the rows there, and polls the streaming replica until the row shows up. From the root of your copy, run `./reps/05/run.sh <primary> <replica>`; the top of `run.sh` shows the way for Postgres in containers.

Expected: `primary=1 replica=1`, and the replica lists the row with the note `replica check`. The replica may show 0 for a moment before it catches up. Running it a second time fails on the primary key: delete the row on the primary before a retry.
