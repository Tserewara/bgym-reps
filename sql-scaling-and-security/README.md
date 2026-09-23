# SQL · Scaling and security

`bgym start sql-scaling-and-security` starts pinned Postgres 16 containers (a primary, a streaming replica and two shards) plus a Python container with psycopg already installed. Nothing gets installed on your machine. Most reps take SQL in `reps/NN/answer.sql`. The injection, replica and shard reps have their own `run.sh`, and their statements name the file you edit. `bgym reset` drops the replica volume and recreates every database.

Finish `sql-optimizing` first. You should be comfortable reading a transaction and a query result, and you'll look up role grants, prepared statements and connection parameters as you go. The reps are about reading what an application, a replica or a routing rule really does.

The main database holds bank accounts and a rides app, and it has problems on purpose. The rides table stores rider names and emails that a public view has to hide, the injection scripts get hostile input, the replica can lag, and the hand-written shard rule sends every key to the same server. The app scripts run inside the compose container, so you don't need psycopg on your machine.

This is the last set in the SQL trail.
