IF OBJECT_ID (N'tempdb..#Podukt')IS NOT NULL
	BEGIN
 
	DROP TABLE #Podukt
	END
 
 
CREATE TABLE #Podukt(
	[ProduktId] INT ,
	[name] VARCHAR (50) NOT NULL,
	[preis] MONEY )

 
	INSERT #Podukt
	SELECT [produktId], [name],[preis]
	FROM [dbo].[Produkt]
 
DECLARE @Bestellung TABLE (
	[bestellungId] INT,
	[gesamtbetrag] DECIMAL,
	[zeitstempel] DATETIME,
	[kundenId] INT)
 
	INSERT @Bestellung
	SELECT [bestellungId],[gesamtbetrag],[zeitstempel],[kundenId]
	From [dbo].[Bestellung]
 
 
DECLARE @BestellPosition TABLE (
	[bestellPositionId] [int]  NOT NULL,
	[menge] [int] NULL,
	[produktId] [int] NULL,
	[bestellungId] [int] NULL)
 
	INSERT @BestellPosition
	SELECT*
	From [dbo].[BestellPosition]
 
 
IF OBJECT_ID (N'tempdb..##Kunde')IS NOT NULL
	BEGIN
 
	Drop Table ##Kunde
	END
 
 
CREATE TABLE ##Kunde(
	[kundeId] INT ,
	[vorname] VARCHAR (50),
	[nachname] VARCHAR (50),
	[strassenHausnummer] VARCHAR(100),
	[plz] VARCHAR(50),
	[ort]VARCHAR(100)
	)
 
	INSERT ##Kunde
	SELECT [kundenId], [vorname],[nachname],[strassenHausnummer],[plz],[ort]
	FROM [dbo].[Kunde]
 
SELECT kundeId, vorname, nachname,gesamtbetrag,menge,[name]
	FROM ##Kunde K 
		INNER JOIN @Bestellung AS b ON b.kundenId=K.kundeId
		INNER JOIN @BestellPosition AS bp ON bp.bestellungId=b.bestellungId
		INNER JOIN #Podukt ON #Podukt.ProduktId=bp.bestellPositionId
		WHERE k.kundeId = 23
 
 
 
GO