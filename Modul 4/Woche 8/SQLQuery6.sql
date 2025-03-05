
-- Entfernen von mehrfachnamigen Produkten
-- und Einschränkung setzen, um Gleichnamigkeit in Zukunft zu verhidnern

-- Probe
SELECT [Name], COUNT(1) Anzahl
	  FROM [MeinGeschaeftDo].[dbo].[Produkt]
	  GROUP BY [Name]
	  HAVING COUNT(1) > 1

-- Löschung von mehrfachnamigen Produkten (mehrere Male, bis es keine mehr gibt. Grund: wir haben noch keine besseren SQL-Kontrukte dafür gelernt)
DELETE [dbo].[Produkt]
WHERE ProduktId IN 
	(SELECT  MIN(ProduktId) ProduktId
	  FROM [MeinGeschaeftDo].[dbo].[Produkt]
	  GROUP BY [Name]
	  HAVING COUNT(1) > 1)

-- UNIQUE-CONSTRAINT
ALTER TABLE Produkt
ADD CONSTRAINT UK_Produkt_Name UNIQUE([Name])

-- Probe
--INSERT Produkt
--SELECT 'Laptop', 12





