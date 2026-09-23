# SQL · Querying

`bgym start sql-querying` starts a pinned Postgres 16 container and loads a small International Booker Prize longlist into it. Nothing gets installed on your machine. Write each answer in `reps/NN/answer.sql`; `bgym run NN` pipes that file into `psql` and prints the rows. `bgym reset` throws the database away and seeds it again.

You should already be able to select rows and tell a primary key from a foreign key. The reps use the usual vocabulary (filters, joins, subqueries, set operations, aggregates), and you look up the syntax when a rep needs it.

The data covers books, their authors and translators, publishers and ratings. Read `seed/` before the first rep. The data is messy on purpose. Translator IDs and ratings can be `NULL`, one author has no book, one book has no author, two publisher records share a name, and one publisher name ends in a space. That's what the data is like; it doesn't tell you what to write.

This is the first SQL set. `sql-designing-and-writing` comes after it.
