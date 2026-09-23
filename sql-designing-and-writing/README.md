# SQL · Designing and writing

`bgym start sql-designing-and-writing` starts a pinned Postgres 16 container with a small MBTA CharlieCard schema in it. Nothing gets installed on your machine. The tables and seed data are in `seed/`. Write your SQL in `reps/NN/answer.sql`; `bgym run NN` sends it to `psql`. `bgym reset` throws the database away and seeds it again.

Finish `sql-querying` first; you should be able to read joins and aggregates without stopping. This set is about turning a requirement into schema objects, and about changing data without breaking a reference or losing an audit trail.

The data covers riders, cards, stations and swipes, plus an audit table of card status changes. It's messy on purpose. One station name ends in a space, two cards and two stations have no swipes, and a blocked card is still in the data. Balances are `numeric`, timestamps carry a time zone, and card status is an enum. Several reps make their change inside a transaction, look at the result and roll it back.

`sql-viewing` comes after this set.
