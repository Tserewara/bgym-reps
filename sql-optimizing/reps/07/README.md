# 07 · Make a transfer atomic

In one transaction, move 30.00 from Alice's wallet to Bob's and commit. Then start a second transfer of 200.00, check the balance, and roll it back when the check fails. Return both balances after each decision.

Expected: after the commit, Alice has 70.00 and Bob 80.00. After the rollback, the balances are still 70.00 and 80.00. At no point should anyone be able to see money that has left Alice's wallet and not yet reached Bob's.
