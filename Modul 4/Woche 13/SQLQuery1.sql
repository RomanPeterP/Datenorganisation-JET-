CREATE OR ALTER TRIGGER BestellPositionOnInsertUpdateDelete
ON BestellPosition
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
	ROLLBACK TRANSACTION
END
GO


UPDATE BestellPosition
SET ProduktId = 10
WHERE BestellPositionId = 1


