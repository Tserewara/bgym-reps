# 01 · Grant the public view

Create a role named `app_reader` that can't log in. Grant it usage on the schema and `SELECT` on `ride_public`, and nothing on `rides`. Then `SET ROLE app_reader` and return the rows it can read. Drop the role at the end so the next attempt starts clean.

Expected: 3 rows with 4 columns: ride ID, origin, destination and fare. No rider name or email anywhere. The grant goes on the view, which leaves the personal data out. If `DROP ROLE` fails with "some objects depend on it", you still have to `RESET ROLE` and revoke what you granted.
