# 03 · When the query runs

Predict the whole output, including the `testing` lines and where they appear.
Then `bgym run 3`.

**Expected:**

```
query defined
  testing 1
  testing 2
  testing 3
  testing 5
first pass: 1,3,5
  testing 1
  testing 2
  testing 3
  testing 5
second pass: 1,3,5
```

Two separate surprises, and most people only predict one.

The first: `5` is in the result, and it was added to the list *after* the query
was written. The second: the `testing` lines appear twice.

Both come from the same fact about what `Where` returned. Name that fact in one
sentence.

Then the review question: somebody hands you a method that returns
`IEnumerable<T>` from a `Where` over a database context, and the caller
enumerates it twice. What are you about to tell them, and what would you tell
them to return instead?
