# 03 · How many each

How many albums does each artist have? Every artist appears, including the ones
with none. Order by the count, highest first, then by name.

**Expected: 8 rows.** Miles Davis leads with 7; Chet Baker is last with **0**.

If Chet Baker shows 1, you counted rows instead of albums — a left join gives
him one row with nothing in it, and `COUNT(*)` is happy to count that. Fix it
by changing what you count, not by filtering afterwards.
