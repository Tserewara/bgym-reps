# 06 · Block only the empty card

The request was to block cards whose balance is exactly zero. `answer.sql` is assistant-written and wraps its update in a rollback. Read it and predict how many IDs it will return. Run it, name the predicate that widened the update, then fix it so only the intended card changes.

Expected if it were right: 1 returned ID, card 2. The shipped file returns 5 IDs because its second condition includes every non-retired card.
