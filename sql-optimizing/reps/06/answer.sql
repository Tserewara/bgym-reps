DELETE FROM movies WHERE id <= 12;
VACUUM (ANALYZE) movies;
SELECT COUNT(*) AS movies_left FROM movies;
