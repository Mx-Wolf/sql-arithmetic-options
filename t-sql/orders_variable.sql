CREATE PROCEDURE get_orders_variable
  @bop DATETIME
AS
BEGIN
  DECLARE @vbop DATETIME;
  set @vbop = @bop;

  SELECT o.OrderID 
  FROM Orders o 
  WHERE o.OrderDate > @vbop;
END
