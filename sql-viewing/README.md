# SQL · Viewing

`bgym start sql-viewing` brings up a pinned Postgres 16 container with a small MFA collection. Nothing is installed on your machine. The base tables and seed data are in `seed/`; write each statement in `reps/NN/answer.sql`, and `bgym run NN` sends it to `psql`. `bgym reset` recreates the database and its roles.

You should have finished `sql-designing-and-writing` and be able to read a join, an aggregate and a trigger. This set is about what a view hides, what it keeps current, and who is allowed to see the table behind it.

There are five collections by three artists, one of them soft-deleted, with creation timestamps and a private note. The permanent analysis view exposes only active titles and artists. The imperfect row is deliberate: a view that forgets the deleted predicate reports a collection that the application meant to hide.

Do `sql-designing-and-writing` before this set. Do `sql-optimizing` after it.
