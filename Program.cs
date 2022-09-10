var a = 1;
var b = GetDenominator(0);
try
{
    Console.WriteLine(a / b);
}
finally
{
    Console.WriteLine("Completed");
}

int GetDenominator(int v)
{
    return v;
}
