
-- 1. Regel erstellen

CREATE RULE Rule_Email
AS
	(@email LIKE '%_@__%.__%')
GO

-- 2. Typen kreieren
CREATE TYPE [dbo].[email] FROM [varchar](50) NULL
GO

-- 3. Typen an Regel binden
EXEC sys.sp_bindrule @rulename=N'[dbo].[Rule_Email]', @objname=N'[dbo].[email]'-- , @futureonly='futureonly'
GO

-- 4. ggf. anwenden
ALTER TABLE Kunde
ALTER COLUMN Email email NULL 

-- 5. Test
UPDATE Kunde
SET Email = 'fdds@sdd.at'
WHERE KundeId = 1










