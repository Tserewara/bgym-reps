# C# · Reading Other People’s Code

`bgym start csharp-reading` brings up a .NET 8 SDK container; nothing is installed on your machine. Each rep is a program that already exists at `reps/NN/Program.cs`, and `bgym run NN` compiles it, runs it, and prints the output. Six of them you only read. The last one you edit.

You need enough C# to read a class, a loop and a method call. Not to write one from scratch — that is not what this is for. What it is for is reading code you did not write and being able to say what it actually does, which is a different skill from writing it, and the more useful of the two once a machine produces the first draft.

A rep goes like this. Read the program. Write down what you think it prints, on paper or in a comment, anywhere, as long as it is written before you run. Then run it. The rep is the gap between the two, and if you skip the writing down you will find you agreed with the output in hindsight every single time.

Struct copy semantics, closure capture, deferred execution, synchronization contexts, deterministic disposal, and which `==` the compiler picks: none of it is explained here. Looking it up when you hit it is the part that builds the model. Being told up front is the part that does not.

The traps are the ones that reach production, and most of them are older than .NET 8 by a decade.