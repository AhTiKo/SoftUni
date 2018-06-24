use restaurant;
/*
SELECT department_id, sum(salary) AS 'Total Salary'
FROM employees AS e
GROUP BY e.department_id;

SELECT department_id,count(id) AS 'Number of employees' FROM employees AS e
GROUP BY e.department_id
ORDER BY e.department_id,`Number of employees`;

SELECT department_id, round(AVG(salary),2) FROM employees AS e
GROUP BY e.department_id;

SELECT department_id , ROUND(MIN(salary),2) As 'Min salary' 
FROM employees AS e
GROUP BY e.department_id
HAVING `Min salary` > 800;

SELECT count(id) FROM products AS p
WHERE p.price > 8 AND p.category_id =2
GROUP BY p.category_id;

SELECT category_id,
ROUND(AVG(price),2) AS `Average price`,
ROUND(MIN(price),2) AS `Cheapest Product`,
ROUND(MAX(price),2) AS `Most Expensive Product`
FROM products AS p
GROUP BY p.category_id;
*/
SELECT count(id),price FROM products AS p
GROUP BY p.category_id
HAVING p.price >8;