--Protokollierung von Status�nderungen einer Bestellung
 
--Erstelle einen AFTER UPDATE-Trigger auf Bestellung,
-- der eine �nderung des BestellungStatusId erkennt und diese in der Log-Tabelle speichert.
 
--Hinweis:
--Der Log-Eintrag soll in Nachricht folgendes Format haben:
--�Bestellung X: Status ge�ndert von Y auf Z�
 
--Test:
--�ndere den BestellungStatusId einer Bestellung und �berpr�fe, ob ein passender Log-Eintrag erzeugt wurde.
--�ndere den Status erneut und kontrolliere, ob der Log-Eintrag korrekt ist.

CREATE OR ALTER TRIGGER BestellungStatusUpdate
ON Bestellung
AFTER UPDATE
AS
BEGIN
	
	IF EXISTS(
		SELECT 1 FROM inserted i 
		INNER JOIN deleted d ON i.BestellungId = d.BestellungId
		WHERE i.BestellungStatusId <> d.BestellungStatusId)
		BEGIN
			INSERT [dbo].[Log]([LogTypId], [Nachricht])
			SELECT
				2,
				'Bestellung: ' + CAST(i.BestellungId AS VARCHAR) + ':  Status ge�ndert von ' 
				+ CAST(d.BestellungStatusId AS VARCHAR) + ' auf ' + CAST(i.BestellungStatusId AS VARCHAR)
			FROM inserted i 
				INNER JOIN deleted d ON i.BestellungId = d.BestellungId
			WHERE
				i.BestellungStatusId <> d.BestellungStatusId
	END
END
GO

UPDATE [dbo].[Bestellung]
SET [BestellungStatusId] = 1
WHERE [BestellungId] = 4

GO