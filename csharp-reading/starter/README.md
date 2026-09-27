# C# · Reading Other People's Code

Your copy of the set. The programs are already here, one per rep in `reps/NN/`: you read the first six and edit the seventh. Your explanations go on the bench; your change to rep 07 is committed here.

The statements are on the bench (backendgym.com/reps/csharp-reading) and in `reps/NN/README.md`. Each one prints the program's output, so the work is explaining it.

## First task: the .NET 8 SDK

Every rep compiles and runs with `dotnet run`, so you need the .NET 8 SDK. Setting it up is part of the set:

- install it on your machine, from Microsoft's packages or your system's package manager, or
- run it in a container, with this copy mounted where the SDK can see it.

<details>
<summary>Stuck? A hint for the container way</summary>

The official image is `mcr.microsoft.com/dotnet/sdk:8.0`. Mount the root of your copy into it and set it as the working directory (`-v "$PWD":/work -w /work`), then run `dotnet run --project reps/01` inside it. A long-running container you `docker exec` into saves the SDK's first-run cost on every rep.
</details>

### Check it

- `dotnet --version` prints a version that starts with `8.`
- `dotnet run --project reps/07` prints three lines, the first of them `order 1: 42.50`.

The first run of each project restores and compiles it, which takes a few seconds; the next ones are quicker.

## Doing a rep

1. Read the statement, `reps/NN/README.md`, and the program, `reps/NN/Program.cs`. Read it before you run it.
2. Run it: `dotnet run --project reps/NN`, from the root of your copy.
3. Compare with the output in the statement, and work out why each line is what it is.
4. On the rep's page on the bench (signed in with GitHub), answer the questions under "After the rep" in your conclusions, then mark it done with a line on what it showed you.

## Starting over

Only rep 07 asks you to change code. To go back to the program as it was shipped, `git restore reps/07`, or compare with the first commit of your copy.
