# SQL · Viewing

`bgym start sql-viewing` starts a pinned Postgres 16 container with a small MFA collection in it. Nothing gets installed on your machine. The base tables and seed data are in `seed/`. Write each statement in `reps/NN/answer.sql`; `bgym run NN` sends it to `psql`. `bgym reset` recreates the database and its roles.

Finish `sql-designing-and-writing` first; you should be able to read a join, an aggregate and a trigger. This set is about what a view hides, what it keeps up to date, and who gets to see the table behind it.

There are five collections by three artists, with creation dates and private notes, and one collection is soft-deleted. The permanent view `collection_analysis` shows only the titles and artists of active collections. The soft-deleted row is there on purpose: a view that forgets to filter it out reports a collection the application meant to hide.

`sql-optimizing` comes after this set.
