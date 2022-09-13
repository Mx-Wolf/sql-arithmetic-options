CREATE PROCEDURE get_orders_literal
AS
BEGIN
  SELECT o.OrderID 
  FROM Orders o 
  WHERE o.OrderDate > '1998-05-01';
END
