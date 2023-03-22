// Select libraries that has more than one offer of fantasy book.

MATCH
(l:Library)-[mo:MAKES_OFFER]->(b:Book)-[:IN_GENRE]->(g:Genre { name: 'Fantasy' }) 
WITH l.name AS Library, COUNT(*) AS FantasyBookCount
WHERE FantasyBookCount > 1
RETURN Library, FantasyBookCount
