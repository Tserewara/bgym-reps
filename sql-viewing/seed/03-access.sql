CREATE VIEW collection_analysis AS
SELECT c.title, a.name AS artist
FROM collections AS c
JOIN artists AS a ON a.id = c.artist_id
WHERE c.deleted_at IS NULL;

CREATE ROLE mfa_reader NOLOGIN;
GRANT USAGE ON SCHEMA public TO mfa_reader;
GRANT SELECT ON collection_analysis TO mfa_reader;
