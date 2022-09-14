var a = 1.0;
double b = 0.0;

Console.WriteLine(a/b);
Console.WriteLine("Completed");

double negativeZero;
negativeZero = GetValue(1);

Console.WriteLine(Double.IsNegativeInfinity(1/negativeZero)?"equals":"different");

double GetValue(double factor)=>factor/Double.NegativeInfinity;

