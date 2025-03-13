CREATE OR Alter PROCEDURE GetZufaelligesProdukt
AS
BEGIN
	SELECT CONVERT(varchar(50), NEWID()) Name, (RAND()*100) Preis
END
GO


INSERT [dbo].[Produkt]
EXEC GetZufaelligesProdukt

GO

SELECT * FROM Produkt ORDER BY 1 DESC