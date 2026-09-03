# 05 · Read from the replica

Write one row to `replication_probe` on the primary in `answer.sql`. `run.sh` sends that file to the primary, checks the primary, and polls the streaming replica until the row arrives.

Expected: the primary and replica each report 1 row with note `replica check`; the replica may briefly report 0 before catching up. Writes belong on the primary, and the read replica is allowed to lag.
