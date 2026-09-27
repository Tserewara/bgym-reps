# SQL · Viewing

A small collection from the MFA (the Museum of Fine Arts, Boston) in PostgreSQL 16: artists, their collections with creation dates and private notes, a permanent view and a read-only role. You write each statement in `reps/NN/answer.sql`, run the file with `psql`, and compare with the expected result printed in the statement.

You work in a copy of the set's starter, a repository of your own. Setting up the database is its first task: bring up a Postgres, load `seed/` into it, and check what its README says you should find. How you run Postgres is your call.

Finish `sql-designing-and-writing` first; you should be able to read a join, an aggregate and a trigger. This set is about reading views: the rows one leaves out, and what a role can reach through one without reading the table behind it.

There are five collections by three artists, and one of them is soft-deleted. The permanent view `collection_analysis` shows only the titles and artists of active collections, and the role `mfa_reader` may read that view and nothing else. The soft-deleted row is there on purpose: a view that forgets to filter it out reports a collection the application meant to hide.

`sql-optimizing` comes after this set.
