using System;
using System.Collections.Generic;

class OrderStore
{
    private readonly Dictionary<int, decimal> _totals = new()
    {
        [1] = 42.50m,
    };

    // An assistant wrote this. It compiles, the tests pass, and it is wrong.
    // Your job is in the README.
    public decimal TotalFor(int orderId)
    {
        try
        {
            return _totals[orderId];
        }
        catch
        {
            return 0m;
        }
    }
}

class Program
{
    static void Main()
    {
        var store = new OrderStore();
        Console.WriteLine($"order 1: {store.TotalFor(1)}");
        Console.WriteLine($"order 99: {store.TotalFor(99)}");
        Console.WriteLine("invoice total: " + (store.TotalFor(1) + store.TotalFor(99)));
    }
}
