// For each library, select most offered genre.
// For each library, it gathers genres and their counts to two arrays - same index matches the genre and its count.
// Then it uses reducer with output [max_index, max_count] to go through each index and re-assign the maximum if current count is the highest one.
// If there are more genres with same max count, the first one that was reduced will be selected.

MATCH (l:Library)-[:MAKES_OFFER]->(:Book)-[:IN_GENRE]->(g:Genre)
WITH l, g.name AS GenreName, COUNT(g) AS GenreCount
WITH l, COLLECT(GenreName) AS genres, COLLECT(GenreCount) AS counts
WITH l, genres, REDUCE(currentMax=[0,0], i IN RANGE(0,size(counts)-1) | CASE WHEN counts[i] > currentMax[1] THEN [i,counts[i]] ELSE currentMax END)[0] AS index
RETURN l.name, genres[index]