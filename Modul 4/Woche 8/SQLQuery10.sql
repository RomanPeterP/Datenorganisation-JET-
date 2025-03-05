
INSERT BestellungStatus([Beschreibung], [BeschreibungLang])
SELECT 'Neu', 'Die Bestellung wurde erstellt, aber noch nicht bearbeitet.'
UNION ALL
SELECT 'In Bearbeitung', 'Die Bestellung wird gerade geprüft oder vorbereitet.'
UNION ALL
SELECT 'Freigegeben', 'Die Bestellung wurde geprüft und genehmigt.'
UNION ALL
SELECT 'Versandt', 'Die Ware wurde verschickt.'
UNION ALL
SELECT 'Geliefert', 'Die Ware wurde erfolgreich zugestellt.'
UNION ALL
SELECT 'Abgeschlossen', 'Die Bestellung ist abgeschlossen (z. B. nach Zahlungseingang).'
UNION ALL
SELECT 'Storniert', 'Die Bestellung wurde vom Kunden oder Händler storniert.'
UNION ALL
SELECT 'Zurückgesendet', 'Der Kunde hat die Ware zurückgesendet.'
UNION ALL
SELECT 'Erstattet', 'Eine Rückerstattung wurde durchgeführt'