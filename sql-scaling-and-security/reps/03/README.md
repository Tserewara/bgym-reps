# 03 · Judge a login check

`reps/03/app.py` is a short psycopg login check. Read it first, then run it with your database in `DATABASE_URL`, `DATABASE_URL=<connection> python reps/03/app.py`, and compare with the expected result below. Fix it so the hostile password logs nobody in, and run it again.

Expected once fixed: 0 rows for the password `' OR 1=1 --`. The shipped file returns all 4 users.
