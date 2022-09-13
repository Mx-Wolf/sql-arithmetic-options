CREATE OR ALTER PROCEDURE get_orders_literal
AS
BEGIN
  SELECT 
    o.OrderID,
    o.ShipAddress 
  FROM Orders o 
  WHERE o.OrderDate > '1998-05-01';
END
