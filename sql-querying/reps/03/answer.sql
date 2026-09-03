SELECT DISTINCT p.name
FROM publishers AS p
JOIN books AS b ON b.publisher_id = p.id
ORDER BY p.name;
