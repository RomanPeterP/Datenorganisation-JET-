IF OBJECT_ID(N'tempdb..#Product') IS NOT NULL
    BEGIN
        DROP TABLE #Product
    END
 
CREATE TABLE #Product
(
    ProductID INT,
    Name      NVARCHAR(50) NOT NULL,
    Price     DECIMAL(10, 2)
)
 
INSERT #Product
SELECT *
FROM Product
 
IF OBJECT_ID(N'tempdb..##Customer') IS NOT NULL
    BEGIN
        DROP TABLE ##Customer
    END
 
CREATE TABLE ##Customer
(
    CustomerID INT,
    Firstname  NVARCHAR(30),
    Lastname   NVARCHAR(30),
    Address    NVARCHAR(50),
    PostalCode NVARCHAR(10),
    City       NVARCHAR(20),
    Email      NVARCHAR(40)
)
 
INSERT ##Customer
SELECT *
FROM Customer
 
DECLARE @Order AS TABLE
                  (
                      OrderID     INT,
                      CustomerID  INT,
                      TotalAmount DECIMAL(10, 2),
                      Timestamp   DATETIME
                  )
 
 
DECLARE @Order_Detail AS TABLE
                         (
                             OrderDetailsID INT,
                             ProductID      INT,
                             OrderID        INT,
                             Amount         TINYINT
                         )
INSERT @Order
SELECT *
FROM [Order]
 
INSERT @Order_Detail
SELECT *
FROM [Order Details]
 
SELECT C.CustomerID,
       Firstname,
       Lastname,
       Email,
       Name,
       Price,
       Timestamp,
       Amount,
       TotalAmount
FROM ##Customer C
         INNER JOIN @Order O ON C.CustomerID = O.CustomerID
         INNER JOIN @Order_Detail OD ON OD.OrderID = O.OrderID
         INNER JOIN #Product P ON P.ProductID = O.OrderID
 