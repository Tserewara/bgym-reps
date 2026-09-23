# 03 · When the query runs

Predict the whole output, including the `testing` lines and where they appear. Then `bgym run 3`.

Expected:

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

There are two surprises here, and most people only predict one. `5` is in the result even though it was added to the list after the query was written. And the `testing` lines appear twice.

Both come from one fact about what `Where` returned. Put that fact in one sentence.

Then the review question: someone hands you a method that returns `IEnumerable<T>` from a `Where` over a database context, and the caller enumerates it twice. What do you tell them, and what should the method return instead?
