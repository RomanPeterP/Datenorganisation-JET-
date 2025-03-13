
CREATE OR ALTER VIEW BestellungenVonHeute
AS
	SELECT 
		BestellungId,
		KundeId,
		Gesamtbetrag,
		Zeitstempel,
		BestellungStatusId 
	FROM Bestellung b
	WHERE
		DAY(Zeitstempel) = DAY(GETDATE())
		AND MONTH(Zeitstempel) = MONTH(GETDATE())
		AND YEAR(Zeitstempel) = YEAR(GETDATE())

GO

SELECT * from BestellungenVonHeute
