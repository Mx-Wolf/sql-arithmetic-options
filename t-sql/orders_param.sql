CREATE PROCEDURE get_orders_param
  @bop DATETIME
AS
BEGIN
  SELECT 
    o.OrderID,
    o.ShipAddress 
  FROM Orders o 
  WHERE o.OrderDate > @bop;
END
