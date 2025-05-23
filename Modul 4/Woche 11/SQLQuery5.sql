USE [MeinGeschaeftDo]
GO
CREATE OR ALTER   FUNCTION [dbo].[KundenNachOrt](@Ort VARCHAR(20)) 
RETURNS TABLE 
AS
RETURN 
(
	SELECT k.*
	FROM Kunde k INNER JOIN PlzOrt po ON k.PlzOrtId = po.PlzOrtId
	WHERE Ort = @Ort
)
GO


SELECT * FROM dbo.KundenNachOrt('Berlin') kno INNER JOIN Kunde k ON kno.KundeId = k.KundeId

GO
