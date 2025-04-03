CREATE OR ALTER TRIGGER BestellPositionOnInsertUpdateDelete
ON BestellPosition
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	DECLARE @GesamtBetrag MONEY
	DECLARE @BestellungId INT =
		(SELECT BestellungId FROM inserted) -- Zugriff auf inserted nur bei UPDATE 

	IF @BestellungId IS NULL
		SET @BestellungId = (SELECT BestellungId FROM Deleted) -- Zugriff auf Deleted nur bei UPDATE und DELETE

	
	EXEC [dbo].[SetGesamtBetrag] @BestellungId, @GesamtBetrag OUT
END
GO

	SELECt * from BestellPosition WHERE BestellungId = 20
	SELECT Gesamtbetrag FROM Bestellung WHERE BestellungId = 20
UPDATE BestellPosition SET Menge = 20 WHERE BestellPositionId = 86
	SELECT Gesamtbetrag FROM Bestellung WHERE BestellungId = 20
	SELECt * from BestellPosition WHERE BestellungId = 20
	









