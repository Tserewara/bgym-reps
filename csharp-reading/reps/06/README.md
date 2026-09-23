# 06 · Eight comparisons

Predict all eight. Then `bgym run 6`.

Expected:

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

Six out of eight is a normal score. The interesting ones are 2, 5 and 7, each for a different reason.

`2` is about something the compiler did to your program before it ran. `5` is about which `==` the compiler picked, and why the declared type of the variable decided it and the type of the value didn't. `7` is the same rule as `5` in a different form.

If your rule is "reference types compare by reference", `3` should look impossible. Look for a better rule.

Review question: you see `if (a == b)` where both are declared `object`. What do you need to know before you can say whether that line is correct?
