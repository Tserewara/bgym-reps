SELECT a.name, COUNT(*) AS book_count
FROM authors AS a
JOIN book_authors AS ba ON ba.author_id = a.id
GROUP BY a.id, a.name
ORDER BY book_count DESC, a.name;
