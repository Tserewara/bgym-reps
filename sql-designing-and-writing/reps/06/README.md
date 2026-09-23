# 06 · Block only the empty card

The request: block the cards whose balance is exactly zero. An assistant wrote `answer.sql`, which wraps its update in a rollback. Read it and predict how many IDs it returns. Run it, name the condition that widened the update, and fix it so only the intended card changes.

Expected once fixed: 1 ID, card 2. The shipped file returns 5, because its second condition matches every card that isn't retired, and none of them is.
