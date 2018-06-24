USE soft_uni;
SELECT COUNT(salary) FROM employees AS e
WHERE e.salary > 
(SELECT AVG(salary) FROM employees);