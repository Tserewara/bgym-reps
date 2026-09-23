# 04 · Close a search injection

`reps/04/app.py` is another short psycopg script. It searches rides by a fragment of the origin and pastes that fragment straight into a `LIKE` pattern. Predict how many rows the hostile fragment returns, run it with `bgym run 4`, then change the call to use a placeholder and a bound value.

Expected once fixed: 0 rows for `%' OR 1=1 --`. The shipped file returns all 3 rides. The `%` wildcards can stay around the value; what has to go is the input being read as SQL.
