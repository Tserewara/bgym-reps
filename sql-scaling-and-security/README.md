# SQL · Scaling and security

A bank and a rides app in PostgreSQL 16, with a public view over personal data, a table of logins, and a probe table for replication. Reps 01, 02 and 05 take SQL in `reps/NN/answer.sql`; reps 03 and 04 run a short Python script, and reps 05 and 06 have their own shell script, named in the statement.

You work in a copy of the set's starter, a repository of your own. Setting up what the set runs on is part of it, in stages: a Postgres with the seed for the first reps, Python with psycopg for the injection reps, a streaming replica for rep 05 and two shard databases for rep 06. The starter's README says what each stage needs and how to check it.

Finish `sql-optimizing` first. You should be comfortable reading a transaction and a query result, and you'll look up role grants, prepared statements and connection parameters as you go. The reps are about reading what an application, a replica or a routing rule does.

This is the last set in the SQL trail.
