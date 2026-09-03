# 01 · Grant the public view

Create a no-login role named `app_reader`, grant it schema usage and `SELECT` on `ride_public`, then use `SET ROLE` to return the rows it can read. Do not grant the role the `rides` table. Remove the role at the end so the next attempt starts clean.

Expected: 3 rows and 4 columns, with ride IDs, origins, destinations and fares. The rider's name and email never appear. The permission belongs on the view that omits PII.
