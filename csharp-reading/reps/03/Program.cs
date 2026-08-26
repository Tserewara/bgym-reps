using System;
using System.Collections.Generic;
using System.Linq;

class Program
{
    static void Main()
    {
        var numbers = new List<int> { 1, 2, 3 };

        var query = numbers.Where(n =>
        {
            Console.WriteLine($"  testing {n}");
            return n % 2 == 1;
        });

        Console.WriteLine("query defined");

        numbers.Add(5);

        Console.WriteLine("first pass: " + string.Join(",", query));
        Console.WriteLine("second pass: " + string.Join(",", query));
    }
}
