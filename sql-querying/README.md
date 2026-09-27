# SQL · Querying

A small International Booker Prize longlist in PostgreSQL 16: books, their authors and translators, publishers and ratings. Each rep is one question the data can answer. You write the query, run it with `psql`, and compare the rows with the expected result printed in the statement.

You work in a copy of the set's starter, a repository of your own. Setting up the database is its first task: bring up a Postgres, load `seed/` into it, and check the counts its README gives. How you run Postgres is your call.

You should already be able to select rows and tell a primary key from a foreign key. The reps use the usual vocabulary (filters, joins, subqueries, set operations, aggregates), and you look up the syntax when a rep needs it.

Read `seed/` before the first rep. The data is messy on purpose. Translator IDs and ratings can be `NULL`, one author has no book, one book has no author, two publisher records share a name, and one publisher name ends in a space. That's what the data is like; it doesn't tell you what to write.

This is the first SQL set. `sql-designing-and-writing` comes after it.
