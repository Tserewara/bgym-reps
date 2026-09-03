# 04 · Close a search injection

`reps/04/app.py` is another roughly forty-line psycopg script. It searches rides by an input fragment and interpolates that fragment into a `LIKE` expression. Predict the returned row count for the hostile fragment, run it in the app container, then change the call to use a placeholder and a bound value.

Expected if it were safe: 0 rows for `%' OR 1=1 --`. The shipped file returns all 3 rides. The wildcard used by the application may remain around the value; the SQL code must not become part of that value.
