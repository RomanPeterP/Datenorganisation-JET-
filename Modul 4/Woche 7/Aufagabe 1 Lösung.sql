INSERT [Order](customerid, totalamount)
VALUES (3, 0)
 
DECLARE @OrderID INT = SCOPE_IDENTITY()
 
INSERT [Order Details] (ProductID, OrderID, Amount)
VALUES (4, @OrderID, 4),
       (7, @OrderID, 2),
       (11, @OrderID, 5)
 
UPDATE O
SET TotalAmount = (SELECT SUM(Amount * Product.Price)
                   FROM [Order Details] OD
                            INNER JOIN Product ON OD.ProductID = Product.ProductID
                   WHERE OD.OrderID = O.OrderID)
FROM [Order] O
WHERE O.OrderID = @OrderID
 
SELECT *
FROM [Order]