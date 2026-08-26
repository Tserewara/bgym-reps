# 01 · Where the copy happened

`Program.cs` is already written. **Read it and predict all three lines before
you run anything.** Write your prediction down — on paper, in a comment, wherever
— because the point of this rep is the gap between it and the output.

Then `bgym run 1`.

**Expected:**

```
a: 0
b: 0, 1
c: 1
```

If you predicted `a: 1`, you read `Bump()` as changing the thing in the list.
It changed a copy that no longer exists — and the compiler let you write it
without a word.

Line `c` is the one worth sitting with: same struct, same method, different
answer. Work out what is different about an array before you look it up, then
look it up and see if you were right.

Now the part that matters more than the answer: **the compiler accepted
`counters[0].Bump()` silently.** What would you have to know to catch that in
somebody else's pull request?
