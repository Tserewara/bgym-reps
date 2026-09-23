# 02 · Bind typed values

Prepare a statement that takes an integer account ID and returns that account's balance, and execute it for Alice. Then select the interval `'90 minutes'`, and look up the identity setting of `accounts.id` in `information_schema.columns`.

Expected: Alice's balance is `100.00`, the interval prints as `01:30:00`, and `accounts.id` has `ALWAYS` identity generation. The account ID travels as a parameter, never inside the SQL text, and the balance comes back as exact `numeric`, not a float or `money`.
