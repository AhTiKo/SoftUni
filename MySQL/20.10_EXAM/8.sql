SELECT p.id,CONCAT(cat.name,' - ',c.name,' - ',p.name) AS full_path
FROM problems AS p
JOIN contests AS c ON p.contest_id = c.id
JOIN categories AS cat ON c.category_id = cat.id
ORDER BY p.id ASC;