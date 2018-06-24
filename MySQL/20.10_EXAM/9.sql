SELECT c1.id,c1.name
FROM categories AS c1
LEFT JOIN categories AS c2 ON c2.parent_id = c1.id
WHERE c2.id IS NULL
ORDER BY c1.name ASC, c1.id ASC;