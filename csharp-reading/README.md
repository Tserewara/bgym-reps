# C# · Reading Other People's Code

`bgym start csharp-reading` starts a .NET 8 SDK container, so nothing gets installed on your machine. Each rep is a program that already exists at `reps/NN/Program.cs`, and `bgym run NN` compiles it, runs it and prints the output. You only read the first six. You edit the last one.

You need enough C# to read a class, a loop and a method call. You don't need to be able to write them from scratch, and this set won't ask you to. It trains reading code you didn't write and saying what it actually does. That's a different skill from writing it, and once a machine writes the first draft it's the one you use more.

Every rep works the same way. Read the program. Write down what you think it prints, on paper or in a comment, but write it before you run anything. Then run it and compare. Skip the writing and you'll find you agreed with the output in hindsight every time.

Struct copies, closure capture, deferred execution, synchronization contexts, deterministic disposal, and which `==` the compiler picks: none of it is explained here. Looking it up when a rep hits it is how the model gets built.

These are traps that reach production, and most of them have been around for at least a decade before .NET 8.
