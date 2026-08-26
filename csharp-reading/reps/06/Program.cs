using System;

class Program
{
    static void Main()
    {
        string literalA = "gym";
        string literalB = "gym";
        string built = "g" + GetY() + "m";

        Console.WriteLine($"1: {literalA == literalB}");
        Console.WriteLine($"2: {ReferenceEquals(literalA, literalB)}");
        Console.WriteLine($"3: {literalA == built}");
        Console.WriteLine($"4: {ReferenceEquals(literalA, built)}");

        object boxedA = literalA;
        object boxedBuilt = built;
        Console.WriteLine($"5: {boxedA == boxedBuilt}");
        Console.WriteLine($"6: {boxedA.Equals(boxedBuilt)}");

        object one = 1;
        object anotherOne = 1;
        Console.WriteLine($"7: {one == anotherOne}");
        Console.WriteLine($"8: {one.Equals(anotherOne)}");
    }

    static string GetY() => "y";
}
