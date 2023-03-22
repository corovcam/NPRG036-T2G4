// Aggregate query to find number of available lease offers of fantasy books for given date '2022-10-30' per library.

MATCH
 (l:Library)-[mo:MAKES_OFFER]->(:Book)-[:IN_GENRE]->(:Genre { name: 'Fantasy' })
WHERE (date(mo.availableFrom) <= date('2022-10-30') <= date(mo.availableUntil)) AND (mo.availability = 'available')
RETURN l.name AS library, COUNT(mo) AS availableOffersCount