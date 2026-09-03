# 02 · Inspect the card schema

Use PostgreSQL's catalog views to return the columns of `cards`, their declared types, whether they accept `NULL`, and their defaults, in ordinal order. Do not read `seed/01-schema.sql` to manufacture the output.

Expected: 6 rows. `id` is an integer identity, `balance` is `numeric(10,2)` and non-null with a zero default, `status` is `card_status` and non-null with an `active` default, `registered_at` is `timestamp with time zone`, and `deleted` is boolean with a false default. The result should describe the database you connected to.
