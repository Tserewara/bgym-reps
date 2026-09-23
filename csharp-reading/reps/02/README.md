# 02 · Two loops, one difference

Predict both lines. Then `bgym run 2`.

Expected:

```
for:     3,3,3
foreach: 0,1,2
```

Most people predict `0,1,2` twice. Some predict `3,3,3` twice, because they got burned once and overcorrected.

The two loops differ in one way, and it's about how many variables exist. Say out loud how many `i` there are and how many `n` there are, and the output stops being surprising.

One more thing to look up, because it decides how far you can trust older code: `foreach` hasn't always behaved like this. Find out when it changed, and what that means for code written before then.
