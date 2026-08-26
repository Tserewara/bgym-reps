using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        var fromFor = new List<Func<int>>();
        for (int i = 0; i < 3; i++)
        {
            fromFor.Add(() => i);
        }

        var fromForeach = new List<Func<int>>();
        foreach (var n in new[] { 0, 1, 2 })
        {
            fromForeach.Add(() => n);
        }

        Console.WriteLine("for:     " + string.Join(",", fromFor.ConvertAll(f => f())));
        Console.WriteLine("foreach: " + string.Join(",", fromForeach.ConvertAll(f => f())));
    }
}
