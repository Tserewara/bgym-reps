# SQL · Designing and writing

A small MBTA CharlieCard schema in PostgreSQL 16: riders, cards, stations and swipes, plus an audit table of card status changes that a trigger fills. You write DDL and changes in `reps/NN/answer.sql`, run the file with `psql`, and compare with the expected result printed in the statement.

You work in a copy of the set's starter, a repository of your own. Setting up the database is its first task: bring up a Postgres, load `seed/` into it, and check what its README says you should find. How you run Postgres is your call.

Finish `sql-querying` first; you should be able to read joins and aggregates without stopping. This set is about turning a requirement into schema objects, and about changing data without breaking a reference or losing an audit trail.

The data is messy on purpose. One station name ends in a space, two cards and two stations have no swipes, and a blocked card is still in the data. Balances are `numeric`, timestamps carry a time zone, and card status is an enum. Several reps make their change inside a transaction, look at the result and roll it back, so the next rep starts from the seed.

`sql-viewing` comes after this set.
