
-- Löschen von "toten Betsellungen"

SELECT * FROM Bestellung B
LEFT JOIN BestellPosition BP ON B.BestellungId = BP.BestellungId
WHERE BP.BestellungId IS NULL

DELETE Bestellung 
	FROM Bestellung B
	LEFT JOIN BestellPosition BP ON B.BestellungId = BP.BestellungId
	WHERE BP.BestellungId IS NULL



