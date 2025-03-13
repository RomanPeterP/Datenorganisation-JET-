
CREATE OR ALTER PROCEDURE SetGesamtBetrag(@BestellungId INT, @GesamtBetrag MONEY OUTPUT)
AS
BEGIN
	
	IF @BestellungId IS NULL
	BEGIN
		PRINT 'BestellungId ist NULL!'
		RETURN
	END
			
	SET @GesamtBetrag =
		(SELECT
			SUM(menge*preis)
		FROM Bestellung B
			INNER JOIN BestellPosition BP ON BP.bestellungId = B.bestellungId
			INNER JOIN Produkt P ON P.produktId= BP.produktId
		WHERE
			BP.BestellungId = @BestellungId)

		UPDATE Bestellung
		SET GesamtBetrag = ISNULL(@GesamtBetrag, 0)
		WHERE
			BestellungId = @BestellungId


END
GO

DECLARE @GesamtBetrag MONEY
EXEC SetGesamtBetrag 3, @GesamtBetrag OUTPUT

SELECT @GesamtBetrag

