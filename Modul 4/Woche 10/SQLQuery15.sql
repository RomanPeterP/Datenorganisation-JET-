CREATE OR ALTER FUNCTION KundenNachOrt(@Ort VARCHAR(20)) 
RETURNS TABLE 
AS
RETURN 
(
	SELECT k.* FROM Kunde k INNER JOIN PlzOrt po ON k.KundeId = po.PlzOrtId
	WHERE Ort = @Ort
)
GO

SELECT * FROM KundenNachOrt('Berlin')
