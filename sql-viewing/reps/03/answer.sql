BEGIN;
CREATE OR REPLACE VIEW artist_collection_counts AS
SELECT a.name AS artist, COUNT(c.id) AS collection_count
FROM artists AS a
JOIN collections AS c ON c.artist_id = a.id
GROUP BY a.id, a.name;
SELECT artist, collection_count FROM artist_collection_counts ORDER BY artist;
ROLLBACK;
