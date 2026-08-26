// Read this. Do not run it yet.
using System;
using System.Collections.Generic;

struct Counter
{
    public int Value;
    public void Bump() => Value++;
}

class Program
{
    static void Main()
    {
        var counters = new List<Counter> { new Counter() };

        counters[0].Bump();
        Console.WriteLine($"a: {counters[0].Value}");

        var copy = counters[0];
        copy.Bump();
        Console.WriteLine($"b: {counters[0].Value}, {copy.Value}");

        var array = new Counter[1];
        array[0].Bump();
        Console.WriteLine($"c: {array[0].Value}");
    }
}
