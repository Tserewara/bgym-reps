# 07 · Make a transfer atomic

Transfer 30.00 from Alice's wallet to Bob's wallet in one transaction, commit it, then attempt a second transfer of 200.00 and roll that one back after the balance check fails. Return balances after each decision.

Expected: after the committed transfer Alice is 70.00 and Bob is 80.00. After the rejected transfer those same balances remain. The database must not expose a half-transfer between the two updates.
