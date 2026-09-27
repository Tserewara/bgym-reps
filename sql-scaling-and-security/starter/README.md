# SQL · Scaling and security

Your copy of the set. You write every answer here and commit it, so coming back to a rep in a few weeks means you can compare today's fix with the one you wrote the first time.

The statements are on the bench (backendgym.com/reps/sql-scaling-and-security) and in `reps/NN/README.md`. Each one prints its expected result.

Setting up what the set runs on is part of the set, and it comes in four stages. You need the first one before rep 01; the others can wait for the rep that uses them.

## Stage 1, before rep 01: the primary

1. Run a PostgreSQL 16 server you can reach with `psql`, and connect as a superuser: the seed creates a role, and rep 01 creates another. A container, a compose file you write yourself, a local install: your choice.
2. Create an empty database for the set, unless your setup already made one. The examples in this README call it `bank`.
3. Load `seed/01-schema.sql`, then `seed/02-data.sql`.

<details>
<summary>Stuck? A first hint</summary>

The official `postgres:16` image reads `POSTGRES_USER`, `POSTGRES_PASSWORD` and `POSTGRES_DB` when it starts, and creates that database for you. Publish its port 5432 on a free port of your machine. If you will build the replica in containers too, start this one on a Docker network you created (`docker network create`), so the replica can reach it by name.
</details>

<details>
<summary>Still stuck? A second hint</summary>

`psql` loads a file with `-f`: `psql <connection> -f seed/01-schema.sql`. A connection string looks like `postgresql://user:password@localhost:PORT/database`.
</details>

You need a `psql` client on your machine for the commands in this README. If Postgres runs in a container and you would rather not install one, feed a file to the container's own `psql` on standard input: `docker exec -i <container> psql -U <user> -d <database> < seed/01-schema.sql`.

**Check it.** `SELECT count(*) FROM accounts;` returns `4`, `SELECT count(*) FROM rides;` returns `3`, and `\du` lists a role named `replicator`.

## Stage 2, before rep 03: Python with psycopg

Reps 03 and 04 are short Python scripts that connect with psycopg 3 and read the connection from `DATABASE_URL`. Any Python 3.10 or later works.

<details>
<summary>Stuck? A hint</summary>

A virtual environment keeps it out of your system Python: `python3 -m venv .venv`, then `.venv/bin/pip install "psycopg[binary]"`. The binary extra brings its own copy of `libpq`.
</details>

**Check it.** `DATABASE_URL=<connection> .venv/bin/python reps/03/app.py` (or plain `python` once the environment is active) prints `returned=` and a number.

## Stage 3, before rep 05: a streaming replica

A second PostgreSQL 16 server that follows the primary: every change committed on the primary shows up on the replica a moment later, and the replica refuses writes. The seed already created the role it connects as: `replicator`, password `replicator`, with the `REPLICATION` attribute.

<details>
<summary>Stuck? A first hint</summary>

Two things have to be true on the primary: it keeps enough write-ahead log for a standby (Postgres 16's defaults already do), and it accepts a replication connection from where the replica runs. The second one is a line in `pg_hba.conf`, whose path `SHOW hba_file;` prints; the official image's file allows replication from localhost only. The line has the shape `host replication replicator <addresses> scram-sha-256`, where `<addresses>` is a CIDR range the replica connects from, or `all`. Then `SELECT pg_reload_conf();` on the primary.
</details>

<details>
<summary>Still stuck? A second hint</summary>

The replica starts from a copy of the primary's data directory, made with `pg_basebackup` as `replicator`. Its `-R` flag writes the settings that make the copy start as a standby that follows the primary. Then start a Postgres on that directory.
</details>

<details>
<summary>Still stuck? A third hint</summary>

With containers: create a named volume, then run `pg_basebackup` from a throwaway `postgres:16` container on the same Docker network as the primary, as the `postgres` user (`-u postgres`; a new volume mounted at `/var/lib/postgresql/data` is already owned by it). Point it at the primary's container name with `-h`, give the password in `PGPASSWORD=replicator`, and write into a directory inside the volume, for example `-D /var/lib/postgresql/data/pgdata`, with `-R -X stream`. Then start a second `postgres:16` on that volume with `PGDATA` set to that directory, on the same network, and publish its port 5432 on another free port of your machine.
</details>

**Check it.** Connect to the replica as the same superuser and database as the primary: the copy has the same users. `SELECT pg_is_in_recovery();` returns `t` and `SELECT count(*) FROM accounts;` returns `4`.

## Stage 4, before rep 06: two shard databases

Two more databases, `shard_a` and `shard_b`, each with `shard-seed/01-schema.sql` loaded. They can live on the primary's server: the rep is about the routing rule, not about the servers.

**Check it.** In each of them, `\dt` lists one table, `routed_events`.

## Doing a rep

1. Read the statement, `reps/NN/README.md`. Read `seed/` before the first one: the rides table keeps personal data that a view has to hide, and the logins are stored as typed.
2. Write your answer where the statement says: `reps/NN/answer.sql` for reps 01, 02 and 05, `app.py` for reps 03 and 04, `shard.sh` for rep 06. In reps 03, 04 and 06 an assistant already wrote the code: read it first, then run it.
3. Run it the way the statement says: `psql <connection> -f reps/NN/answer.sql`, `python reps/NN/app.py`, or the rep's script from the root of your copy.
4. Compare with the expected result in the statement. Nothing checks it for you.
5. Mark the rep done on its page on the bench (signed in with GitHub), with a line on what it showed you. Some reps ask a question or two after you finish: they are on the bench page, under the statement.

## Starting over

Rep 01 drops the role it creates, and rep 06 empties the shard tables before it routes. Rep 05 leaves its row on the primary and the replica: delete it on the primary to run the rep again. To go back to the seed, drop the set's database from a session on the `postgres` database, create it again and load the two seed files; the replica follows, since it copies the whole server.

```sh
psql postgresql://user:password@localhost:5433/postgres -c 'DROP DATABASE bank' -c 'CREATE DATABASE bank'
```

Use your own port and user.

The `replicator` role lives in the server, not in the database, so reloading `seed/01-schema.sql` then says `role "replicator" already exists`: that line is harmless, and the rest of the file still runs.
