CREATE OR ALTER TRIGGER BestellPositionOnInsertUpdateDelete
ON BestellPosition
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	DECLARE @GesamtBetrag MONEY
	DECLARE @BestellungId INT =
		(SELECT DISTINCT BestellungId FROM inserted) -- Zugriff auf inserted nur bei UPDATE 

	IF @BestellungId IS NULL
		SET @BestellungId = (SELECT DISTINCT BestellungId FROM Deleted) -- Zugriff auf Deleted nur bei UPDATE und DELETE

	EXEC [dbo].[SetGesamtBetrag] @BestellungId, @GesamtBetrag OUT

	IF(SELECT COUNT(1) FROM BestellPosition WHERE BestellungId = @BestellungId) = 0
	BEGIN
		DELETE Bestellung WHERE BestellungId = @BestellungId
	END
END
GO


DECLARE @BestellungId TABLE
SET @BestellungId  = (SELECT BestellungId FROM Bestellung WHERE BestellungId = 21) 


	
	DELETE BestellPosition WHERE BestellungId IN(20, 21)
	
	SELECT * FROM Bestellung WHERE BestellungId = 20

	SELECt * from BestellPosition WHERE BestellungId = 20



