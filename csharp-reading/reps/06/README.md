# 06 · Eight comparisons

Predict all eight. Then `bgym run 6`.

**Expected:**

```
1: True
2: True
3: True
4: False
5: False
6: True
7: False
8: True
```

Getting six of eight is normal. The interesting ones are **2**, **5** and
**7**, and they are interesting for three different reasons.

`2` is about something the compiler did to your program before it ran. `5` is
about which `==` the compiler picked, and why the type of the *variable*
decided that rather than the type of the *value*. `7` is the same rule as `5`
wearing a different hat.

The rule you are looking for is not "reference types compare by reference".
That rule is what makes `3` look impossible.

Review question: you see `if (a == b)` where both are declared `object`. What do
you now need to know before you can say whether that line is correct?
