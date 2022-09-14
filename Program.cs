var a = 1.0;
double b = 0.0;

Console.WriteLine(a/b);
Console.WriteLine("Completed");

double negativeZero;
negativeZero = GetValue(1);

Console.WriteLine(Double.IsNegativeInfinity(1/negativeZero)?"equals":"different");

double GetValue(double factor)=>factor/Double.NegativeInfinity;

var withZero = new Buffer(0d);
var withNegative = new Buffer(-0d);

Console.WriteLine(new Buffer(0).Equals(new Buffer(-0))?"struct equals":"struct different");
Console.WriteLine(withZero.Value.Equals(withNegative.Value)?"value equals":"value different");


public struct Buffer
{
  public Buffer(double value)
  {
    Value= value;
  }
  public double Value {get;}
}


