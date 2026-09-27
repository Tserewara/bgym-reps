# SQL · Optimizing

Your copy of the set. You write every answer here and commit it, so coming back to a rep in a few weeks means you can compare today's SQL with what you wrote the first time.

The statements are on the bench (backendgym.com/reps/sql-optimizing) and in `reps/NN/README.md`. Each one prints its expected result.

## First task: a Postgres of your own

The set runs on PostgreSQL 16, loaded with half a million generated movies, two wallets and one cinema seat. Setting it up is part of the set:

1. Run a PostgreSQL 16 server you can reach with `psql`. A container, a compose file you write yourself, a local install: your choice.
2. Create an empty database for the set, unless your setup already made one.
3. Load `seed/01-schema.sql`, then `seed/02-data.sql`. The second one generates the 500,000 movies with `generate_series` and then runs `ANALYZE`; give it a few seconds.

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

- `\dt` lists four tables: `movies`, `seat_sales`, `seats`, `wallets`.
- `SELECT count(*) FROM movies;` returns `500000`.
- `SELECT owner, balance FROM wallets ORDER BY id;` returns Alice with `100.00` and Bob with `50.00`, and `SELECT remaining FROM seats;` returns `1`.

If one of those is off, load the files again into an empty database.

## Doing a rep

1. Read the statement, `reps/NN/README.md`. Read `seed/` before the first one: two titles nearly match, two rows are scratch, and the reps are about what the planner and two sessions do with them.
2. Write your SQL in `reps/NN/answer.sql`, which is already there in every rep. In reps 03, 06 and 08 an assistant already wrote it: read it first, then run it. Rep 08 runs through `./reps/08/run.sh <connection>`, from the root of your copy, instead of `psql -f`.
3. Run it: `psql <connection> -f reps/NN/answer.sql`, where `<connection>` is your database, for example `postgresql://user:password@localhost:5433/movies`.
4. Compare with the expected result in the statement. Nothing checks it for you.
5. Mark the rep done on its page on the bench (signed in with GitHub), with a line on what it showed you. Some reps ask a question or two after you finish: they are on the bench page, under the statement.

## Starting over

What a rep leaves behind stays: the indexes from reps 02 and 04 shape the plans of the reps after them, rep 06 deletes rows for good (`VACUUM` cannot run inside a transaction, so nothing rolls it back), and rep 07 commits a transfer. Rep 08's `run.sh` resets the seat itself.

To start from the seed again, which rep 06 asks for, connect to the `postgres` database, drop the set's database, create it again and load the two seed files.

```sh
psql postgresql://user:password@localhost:5433/postgres -c 'DROP DATABASE movies' -c 'CREATE DATABASE movies'
```
