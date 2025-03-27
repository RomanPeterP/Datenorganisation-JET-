SET XACT_ABORT OFF

DECLARE @KundenId INT = 1


BEGIN TRY
	BEGIN TRANSACTION
	UPDATE Kunde 
	SET Email = 'eva@eee.de'
	WHERE KundeId = @KundenId

	DECLARE @int INT = 1/0
	
END TRY

BEGIN CATCH
	PRINT 'ROLLBACK wird ausgeführt' 
	ROLLBACK TRANSACTION  
END CATCH


SELECT email from Kunde
WHERE KundeId = @KundenId



