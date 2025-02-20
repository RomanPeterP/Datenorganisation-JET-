
DECLARE @ProduktId INT = 1
DECLARE @Preis MONEY = 1050

SELECT * FROM Produkt 
WHERE
	ProduktId = @ProduktId

UPDATE Produkt
	SET Preis = @Preis
WHERE
	ProduktId = @ProduktId

PRINT 'Getroffen ' + CONVERT(VARCHAR, @@ROWCOUNT)

SELECT * FROM Produkt 
WHERE
	ProduktId = @ProduktId


UPDATE Produkt
SET 
	Preis = P.[UnitPrice]
FROM
	[Northwind].[dbo].[Products] P
WHERE 
	Produkt.ProduktId = 1
	
-- DROP TABLE [dbo].[Table_1]

ALTER TABLE [dbo].[Kunde]
ADD Telefonnummer VARCHAR(20)

ALTER TABLE [dbo].[Kunde]
ADD Telefonnummer2 VARCHAR(20)

ALTER TABLE [dbo].[Kunde]
DROP COLUMN Telefonnummer2

ALTER TABLE Kunde 
ALTER COLUMN Telefonnummer VARCHAR(15)

ALTER TABLE Bestellung 
ADD CONSTRAINT DF_Bestellung_Zeitstempel DEFAULT GETDATE() FOR Zeitstempel


UPDATE Bestellung
SET HatBewertung = 0

ALTER Table Bestellung
ALTER Column HatBewertung BIT NOT NULL

ALTER Table Bestellung
DROP Column HatBewertung

---Entfernen von Standardwert
--- ALTER TABLE Bestellung DROP CONSTRAINT DF_Bestellung_Zeitstempel







