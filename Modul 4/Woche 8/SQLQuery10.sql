
INSERT BestellungStatus([Beschreibung], [BeschreibungLang])
SELECT 'Neu', 'Die Bestellung wurde erstellt, aber noch nicht bearbeitet.'
UNION ALL
SELECT 'In Bearbeitung', 'Die Bestellung wird gerade gepr�ft oder vorbereitet.'
UNION ALL
SELECT 'Freigegeben', 'Die Bestellung wurde gepr�ft und genehmigt.'
UNION ALL
SELECT 'Versandt', 'Die Ware wurde verschickt.'
UNION ALL
SELECT 'Geliefert', 'Die Ware wurde erfolgreich zugestellt.'
UNION ALL
SELECT 'Abgeschlossen', 'Die Bestellung ist abgeschlossen (z. B. nach Zahlungseingang).'
UNION ALL
SELECT 'Storniert', 'Die Bestellung wurde vom Kunden oder H�ndler storniert.'
UNION ALL
SELECT 'Zur�ckgesendet', 'Der Kunde hat die Ware zur�ckgesendet.'
UNION ALL
SELECT 'Erstattet', 'Eine R�ckerstattung wurde durchgef�hrt'