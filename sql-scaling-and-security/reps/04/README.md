# 04 · Judge a ride search

`reps/04/app.py` is another short psycopg script. It searches rides by a fragment of the origin. Read it first, then run it as you ran rep 03, `DATABASE_URL=<connection> python reps/04/app.py`, and compare with the expected result below. Fix it so the hostile fragment matches nothing.

Expected once fixed: 0 rows for `%' OR 1=1 --`. The shipped file returns all 3 rides.
