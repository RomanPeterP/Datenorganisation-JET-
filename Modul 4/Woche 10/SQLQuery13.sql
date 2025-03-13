CREATE OR ALTER PROCEDURE LoescheInaktiveKunden(@NurVorschau BIT = 1)
AS
BEGIN
 
 
	CREATE TABLE #InaktiveKunden(
		KundeId INT PRIMARY KEY,
		Nachname VARCHAR(20)
		)

	INSERT #InaktiveKunden
	SELECT KundeId, Nachname FROM Kunde WHERE Aktiv = 0
 
	IF @NurVorschau = 0
		BEGIN
			DELETE Kunde WHERE KundeId IN (SELECT KundeId FROM #InaktiveKunden)
			---RETURN @@ROWCOUNT
		END
	ELSE
		SELECT * FROM #InaktiveKunden
 
END
GO

DECLARE @Ret INT
EXEC @Ret = LoescheInaktiveKunden 0

SELECT @Ret Anzahl

GO