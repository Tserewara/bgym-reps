# 03 · Judge a login injection

`reps/03/app.py` is a roughly forty-line Python login example using psycopg. Read it and predict how many rows its deliberately hostile password returns. Run the script inside the compose-provided app container, then replace string interpolation with a bound parameter and run it again.

Expected if it were safe: 0 rows for the password `' OR 1=1 --`. The shipped file returns 4 rows because the input changes the `WHERE` expression into an always-true condition. The fix belongs in the query call, not in a character blacklist.
