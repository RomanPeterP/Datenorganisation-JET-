SET XACT_ABORT OFF

DECLARE @KundenId INT = 1

SELECT email from Kunde
WHERE KundeId = @KundenId

BEGIN TRANSACTION
	UPDATE Kunde 
	SET Email = 'eva@eee.de'
	WHERE KundeId = @KundenId

	SELECT email from Kunde
	WHERE KundeId = @KundenId
	
ROLLBACK TRANSACTION  

SELECT email from Kunde
WHERE KundeId = @KundenId


1.) Geben Sie die letzte KundeId aus Kunde aus
2. ) Fügen Sie einen neuen Datensatz in die Tabelle Kunde INNERHALB einer TRANSACTION und machen Sie anschließend ROLLBACK
3.) Fügen Sie einen neuen Datensatz in die Tabelle Kunde
4.) Geben Sie die letzte KundeId aus Kunde aus



