# 07 · Make a transfer atomic

In one transaction, move 30.00 from Alice's wallet to Bob's and commit. Then, in a second transaction, start a transfer of 200.00: check Alice's balance with a `SELECT`, see that it falls short, and end that transaction with `ROLLBACK`. Return both balances after each decision.

Expected: after the commit, Alice has 70.00 and Bob 80.00. After the rollback, the balances are still 70.00 and 80.00.
