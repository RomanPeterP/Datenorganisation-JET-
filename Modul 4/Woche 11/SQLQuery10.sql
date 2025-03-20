
CREATE OR ALTER  FUNCTION [dbo].[NullZuUnbekannt](@Wert VARCHAR(MAX))
RETURNS VARCHAR(MAX)
AS
	BEGIN
		RETURN ISNULL(@Wert, 'Unbekannt')
	END
GO



SELECT dbo.NullZuUnbekannt(Email) EmailMan  FROM Kunde

GO