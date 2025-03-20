DECLARE @BestellungId INT
DECLARE @GesamtBetrag MONEY

DECLARE BestellungCursor CURSOR FOR
	SELECT BestellungId
	FROM Bestellung

OPEN BestellungCursor

FETCH NEXT
	FROM BestellungCursor
	INTO @BestellungId

WHILE @@FETCH_STATUS = 0
BEGIN

	EXEC [dbo].[SetGesamtBetrag] @BestellungId, @GesamtBetrag

	FETCH NEXT
	FROM BestellungCursor
	INTO @BestellungId
END
	
CLOSE BestellungCursor
DEALLOCATE BestellungCursor
 


