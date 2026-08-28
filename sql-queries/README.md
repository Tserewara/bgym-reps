# SQL · Querying

`bgym start sql-queries` brings up a Postgres 16 in a container and seeds it. You do not create anything, and nothing is installed on your machine. The schema and the data are in `seed/`; read them before you start, because half the traps are sitting in plain sight there. You write your query in `reps/NN/answer.sql`, in the directory `start` made for you, and `bgym run NN` pipes that file into `psql` and prints whatever comes back. `bgym reset` puts the data back the way it was, which is what makes doing a rep twice the same rep.

You need enough SQL to write a `SELECT` with a `WHERE` and a join. Everything past that — outer joins, aggregates, `NULL` semantics, query plans — you will meet here. Looking it up as you hit it is not overhead around the work. It is the work.

The database is a small jazz library: eight artists, eighteen albums, tracks on four of those albums. It is also deliberately imperfect. One artist has no albums. One album has no release year. One track has no duration. Each of those is the trap in some rep, and none of them is unusual in a schema somebody actually shipped.

Nothing here checks your work. Every statement says what the right answer looks like; you run it, you look, you compare. Comparing is the rep.

Seven of them, about two hours all told. The last one is the point: read a query plan and work out why the planner ignored the index you just built for it.