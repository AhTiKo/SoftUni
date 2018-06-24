SELECT d.name AS department_name, c.name AS category_name, COUNT(r.id) AS num
FROM departments AS d
JOIN categories AS c ON c.department_id = d.id
JOIN reports AS r ON r.category_id = c.id
GROUP BY d.id,c.id
ORDER BY d.name