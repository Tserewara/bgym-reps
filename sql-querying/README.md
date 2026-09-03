# SQL · Querying

`bgym start sql-querying` brings up a pinned Postgres 16 container and seeds a small International Booker Prize longlist. Nothing is installed on your machine. Read `seed/` to see the tables and edge cases, then write each answer in `reps/NN/answer.sql`; `bgym run NN` pipes that file into `psql` and prints the rows. `bgym reset` removes the database volume and seeds it again.

You need enough SQL to select rows and recognise a primary key and foreign key. The statements assume the course vocabulary around filters, joins, subqueries, set operations and aggregates. Find the syntax as each trap asks for it.

The data has books, authors, translators, publishers and ratings. It is deliberately imperfect: translator IDs and ratings can be `NULL`, one author has no book, one book has no author, two publisher records share a name, and one publisher name has trailing whitespace. Those are data conditions, not hints about the query.

This is the first SQL set, so nothing comes before it. Finish here before `sql-designing-and-writing`.
