# 07 · The one that compiles and lies

This rep is a review, not a prediction.

An assistant wrote `OrderStore.TotalFor`. It compiles, and a test that asks for order 1 passes. Run it and read the output.

Expected:

```
order 1: 42.50
order 99: 0
invoice total: 42.50
```

The last line is a wrong money figure, and nothing anywhere flagged it.

Do three things, in this order.

1. In a comment, write what an invoice total of `42.50` actually means here, and what it claims to mean. Be precise about the difference between "this order is worth nothing" and "we don't know what this order is worth".
2. Change `TotalFor` so a missing order can't be silently folded into a total. Keep the signature. There's more than one defensible answer, and they differ in what they force the caller to do. Pick one, and say in a comment what the other would have cost.
3. The rep itself: write the comment you'd leave on that pull request. "Add error handling" doesn't count. Write the sentence that makes the author see the invoice.

`catch { }` with a default return is the most common thing an assistant writes when it isn't sure. You'll read it again this month.
