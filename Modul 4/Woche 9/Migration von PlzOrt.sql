
-- neue Spalte
ALTER TABLE [dbo].[Kunde]
ADD PlzOrtId INT NULL
GO

-- Migration der Daten in die neue Spalte
UPDATE [dbo].[Kunde]
SET PlzOrtId = (SELECT po.PlzOrtId FROM [dbo].[PlzOrt] po WHERE Kunde.Plz = po.Plz AND Kunde.Ort = po.Ort)
GO

-- neue Spalte wird mit NULL gesetzt
ALTER TABLE [dbo].[Kunde]
ALTER COLUMN PlzOrtId INT NOT NULL
GO

-- Beziehung zw. Kunde und PlzOrt herstellen
ALTER TABLE dbo.Kunde
ADD CONSTRAINT FK_Kunde_PlzOrt FOREIGN KEY(PlzOrtId) 
	REFERENCES dbo.PlzOrt(PlzOrtId)	
GO

-- Unnötige Spalte Plz aus Kunde dropen
ALTER TABLE dbo.Kunde
DROP COLUMN [Plz]
GO

-- Unnötige Spalte Ort aus Kunde dropen
ALTER TABLE dbo.Kunde
DROP COLUMN [Ort]
GO

--Übung
--Frage ALLE Kunden-Informationen samt Bestellung und Bestellposition ab

SELECT * FROM Kunde k 
INNER JOIN [dbo].[PlzOrt] po ON k.PlzOrtId = po.PlzOrtId
INNER JOIN Bestellung b ON b.KundeId = k.KundeId 
INNER JOIN BestellPosition bp ON bp.BestellungId = b.BestellungId