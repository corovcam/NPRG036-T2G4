// Find books that are being translation of a book also offered by the same library.

MATCH
 (l:Library)-[mo:MAKES_OFFER]->(b1:Book)
WHERE EXISTS((l)-[:MAKES_OFFER]->(:Book)<-[:TRANSLATION_OF]-(b1))
RETURN l.name AS Libray, b1.name AS Book, mo.sku AS SKU