SELECT p.name, b.title
FROM publishers AS p
NATURAL JOIN books AS b
ORDER BY p.id, b.id;
