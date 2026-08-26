# 02 · Two loops, one difference

Predict both lines. Then `bgym run 2`.

**Expected:**

```
for:     3,3,3
foreach: 0,1,2
```

Most people predict `0,1,2` twice. Some predict `3,3,3` twice, having been
burned once and over-corrected.

The two loops differ in exactly one way, and it is not a rule about closures —
it is a rule about *how many variables exist*. Say out loud how many `i` there
are and how many `n` there are, and the output stops being surprising.

One more thing to find out, because it will decide whether you trust a code
review: the `foreach` behaviour has not always been this way. Find out when it
changed and what that means for code written before then.
