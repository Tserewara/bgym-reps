# SQL · Viewing

Your copy of the set. You write every answer here and commit it, so coming back to a rep in a few weeks means you can compare today's SQL with what you wrote the first time.

The statements are on the bench (backendgym.com/reps/sql-viewing) and in `reps/NN/README.md`. Each one prints its expected result.

## First task: a Postgres of your own

The set runs on PostgreSQL 16, loaded with a small Museum of Fine Arts collection, a view and a role. Setting it up is part of the set:

1. Run a PostgreSQL 16 server you can reach with `psql`, and connect as a superuser: the seed creates a role, and rep 06 switches to it with `SET ROLE`. A container, a compose file you write yourself, a local install: your choice.
2. Create an empty database for the set, unless your setup already made one.
3. Load `seed/01-schema.sql`, `seed/02-data.sql` and `seed/03-access.sql`, in that order. The last one creates the view `collection_analysis` and the role `mfa_reader`.

<details>
<summary>Stuck? A first hint</summary>

The official `postgres:16` image reads `POSTGRES_USER`, `POSTGRES_PASSWORD` and `POSTGRES_DB` when it starts, and creates that database for you. Publish its port 5432 on a free port of your machine.
</details>

<details>
<summary>Still stuck? A second hint</summary>

`psql` loads a file with `-f`: `psql <connection> -f seed/01-schema.sql`. A connection string looks like `postgresql://user:password@localhost:PORT/database`.
</details>

You need a `psql` client on your machine for the commands below. If Postgres runs in a container and you would rather not install one, feed the file to the container's own `psql` on standard input: `docker exec -i <container> psql -U <user> -d <database> < seed/01-schema.sql`, and the same for every `-f` below.

### Check it

In `psql`, connected to your database:

- `\dt` lists two tables, `artists` and `collections`, and `\dv` one view, `collection_analysis`.
- `SELECT count(*) FROM collections;` returns `5`, and `SELECT count(*) FROM collection_analysis;` returns `4`.
- `\du` lists the role `mfa_reader`.

If one of those is off, load the files again into an empty database.

## Doing a rep

1. Read the statement, `reps/NN/README.md`. Read `seed/` before the first one: one collection is soft-deleted, and the reps are about what a view does with it.
2. Write your SQL in `reps/NN/answer.sql`, which is already there in every rep. In reps 03 and 06 an assistant already wrote it: read it first, then run it.
3. Run it: `psql <connection> -f reps/NN/answer.sql`, where `<connection>` is your database, for example `postgresql://user:password@localhost:5433/mfa`.
4. Compare with the expected result in the statement. Nothing checks it for you.
5. Mark the rep done on its page on the bench (signed in with GitHub), with a line on what it showed you. Some reps ask a question or two after you finish: they are on the bench page, under the statement.

## Starting over

The views you create in reps 01 and 02 stay, and later reps build on them: rep 02 reads the view from rep 01, and so does rep 05. The judge reps and rep 05 roll their changes back.

To start from the seed again, connect to the `postgres` database, drop the set's database, create it again and load the three seed files. The role lives in the server, not in the database, so `03-access.sql` then says `role "mfa_reader" already exists`: that line is harmless, and the grants after it still run.

```sh
psql postgresql://user:password@localhost:5433/postgres -c 'DROP DATABASE mfa' -c 'CREATE DATABASE mfa'
```
