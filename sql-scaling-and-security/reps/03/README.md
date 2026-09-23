# 03 · Judge a login injection

`reps/03/app.py` is a short psycopg login check of the kind an assistant writes with confidence. Read it and predict how many rows it returns for its hostile password. `bgym run 3` runs it inside the app container. Then replace the string interpolation with a bound parameter and run it again.

Expected once fixed: 0 rows for the password `' OR 1=1 --`. The shipped file returns all 4 users, because the input rewrites the `WHERE` clause into one that is always true. Fix it in the query call. Filtering out quote characters leaves the hole open.
