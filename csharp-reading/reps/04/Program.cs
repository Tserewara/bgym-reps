using System;
using System.Threading.Tasks;

class Program
{
    static async Task<string> FetchAsync()
    {
        await Task.Delay(50).ConfigureAwait(false);
        return "done";
    }

    static void Main()
    {
        Console.WriteLine("before");
        // Every article about this says it deadlocks.
        var result = FetchAsync().Result;
        Console.WriteLine($"after: {result}");
    }
}
