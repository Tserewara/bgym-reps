using System;

class Handle : IDisposable
{
    private readonly string _name;
    public Handle(string name)
    {
        _name = name;
        Console.WriteLine($"open {_name}");
    }

    public void Dispose() => Console.WriteLine($"dispose {_name}");
}

class Program
{
    static void Work()
    {
        using (var a = new Handle("a"))
        {
            var b = new Handle("b");
            throw new InvalidOperationException("boom");
        }
    }

    static void Main()
    {
        try
        {
            Work();
        }
        catch (Exception error)
        {
            Console.WriteLine($"caught {error.Message}");
        }
        finally
        {
            Console.WriteLine("finally");
        }

        GC.Collect();
        GC.WaitForPendingFinalizers();
        Console.WriteLine("end");
    }
}
