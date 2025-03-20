DECLARE @ProduktId INT
DECLARE @ProductName VARCHAR(50)

DECLARE ProductCursor CURSOR FOR
	SELECT ProduktId, Name
	FROM Produkt

OPEN ProductCursor

FETCH NEXT
	FROM ProductCursor
	INTO @ProduktId, @ProductName

WHILE @@FETCH_STATUS = 0
BEGIN

	PRINT 'Product ID: ' + CAST(@ProduktId AS VARCHAR(10))
	PRINT 'Product Name: ' + @ProductName

	FETCH NEXT
	FROM ProductCursor
	INTO @ProduktId ,@ProductName
END
	
CLOSE ProductCursor
DEALLOCATE ProductCursor
 

