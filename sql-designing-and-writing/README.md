# SQL · Designing and writing

`bgym start sql-designing-and-writing` brings up a pinned Postgres 16 container with a small MBTA CharlieCard schema. Nothing is installed on your machine. The tables and seed data live in `seed/`; write SQL in `reps/NN/answer.sql`, and `bgym run NN` sends it to `psql`. `bgym reset` recreates the volume and runs the seed again.

You should have finished `sql-querying` and be comfortable reading joins and aggregates. This set asks you to turn requirements into schema objects and to change data without leaving referential or audit damage behind.

The data has riders, cards, stations and swipes. It is deliberately imperfect: a station name has trailing whitespace, a card has no swipes, a station has no swipes, and a blocked card remains in the data. Balances use `numeric`, timestamps carry time zones, and card status is an enum. Several reps wrap their changes in a transaction and roll them back after inspecting the result.

Do `sql-querying` before this set. Do this set before `sql-viewing`.
