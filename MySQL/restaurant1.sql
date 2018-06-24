USE restaurant;

SELECT id, COUNT(id) 
FROM employees AS e
GROUP BY e.department_id
ORDER BY e.department_id ASC;