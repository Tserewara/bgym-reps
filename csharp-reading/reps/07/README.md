# 07 · The one that compiles and lies

This one is not a prediction. It is a review.

`OrderStore.TotalFor` was written by an assistant. It compiles. A test that
asks for order 1 passes. Run it and read the output.

**Expected:**

```
order 1: 42.50
order 99: 0
invoice total: 42.50
```

The last line is a money figure that is wrong, and nothing anywhere said so.

**Do three things, in this order.**

First, in a comment, write what an invoice total of `42.50` actually means here
versus what it claims to mean. Be precise about the difference between "this
order is worth nothing" and "we do not know what this order is worth".

Second, change `TotalFor` so the missing order cannot be silently rounded into
a total. Keep the signature. There is more than one defensible answer and they
differ in what they force the caller to do — pick one and say in a comment what
the other would have cost.

Third, and this is the actual rep: write the sentence you would leave on that
pull request. Not "add error handling" — the sentence that makes the author see
the invoice.

`catch { }` with a default return is the single most common shape an assistant
produces when it is unsure. You will read it again this month.
