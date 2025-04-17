USE [MeinGeschaeftDo]
GO

/****** Object:  View [dbo].[BestellungenVonHeute]    Script Date: 17.04.2025 09:35:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER   VIEW [dbo].[BestellungenVonHeute]
AS
	SELECT 
		[BestellungId],
		[Vorname] + ' ' + [Nachname] Kunde,
		FORMAT([Gesamtbetrag], 'C') [Gesamtbetrag],
		FORMAT([Zeitstempel], 'dd. MMMM yyyy') Datum,
		FORMAT([Zeitstempel], 'HH:mm') Zeit,
		[Beschreibung] 
	FROM Bestellung b
	INNER JOIN [dbo].[BestellungStatus] bs ON b.BestellungStatusId = bs.BestellungStatusId
	INNER JOIN Kunde k ON k.KundeId = b.KundeId
	WHERE
		DAY(Zeitstempel) = DAY(GETDATE())
		AND MONTH(Zeitstempel) = MONTH(GETDATE())
		AND YEAR(Zeitstempel) = YEAR(GETDATE())
GO

SELECT * FROM [dbo].[BestellungenVonHeute]
GO


