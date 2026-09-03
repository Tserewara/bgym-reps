# SQL · Scaling and security

`bgym start sql-scaling-and-security` brings up pinned Postgres 16 primary, streaming replica and shard containers, plus a Python app container with psycopg already installed. Nothing is installed on your machine. Write SQL in `reps/NN/answer.sql`; the injection reps and shard/replica reps use their local `run.sh` and the file named in their statements. `bgym reset` removes the replica volume and recreates every database.

You should have finished `sql-optimizing` and be comfortable reading a transaction and a query result. The statements assume you can look up role grants, prepared statements and connection parameters. The work is to read what an application, replica or routing rule really does.

The main database has bank accounts and a rides app. It is deliberately imperfect: the rides table contains rider names and emails that a public view must hide, the injection scripts receive hostile input, the replica can lag, and the hand-written shard rule sends every key to one server. The app scripts run inside the compose container, so psycopg is not a host dependency.

Do `sql-optimizing` before this set. This is the last set in the SQL trail.
