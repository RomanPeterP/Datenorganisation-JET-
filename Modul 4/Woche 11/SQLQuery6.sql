
CREATE OR ALTER FUNCTION AnzahlProdukteNachDatum(@Datum DATE)
RETURNS 
@Ergebnis TABLE 
(
	Produkte INT, Datum Date
)
AS
BEGIN
	
	INSERT @Ergebnis
	SELECT
		COUNT(bp.ProduktId),
		@Datum
	FROM [dbo].[BestellPosition] bp
		INNER JOIN Bestellung b ON bp.BestellungId = b.BestellungId
		INNER JOIN Produkt p ON bp.ProduktId = p.ProduktId
	WHERE b.Zeitstempel = @Datum
	
	RETURN 
END
GO
SELECT * FROM AnzahlProdukteNachDatum(NULL)
GO
