USE soft_uni;
/*
14
CREATE TEMPORARY TABLE IF NOT EXISTS `emp` AS(
SELECT * 
FROM employees 
WHERE salary > 30000);
DELETE FROM `emp` WHERE manager_id = 42;
UPDATE emp
SET salary = salary + 5000
WHERE department_id = 1;
SELECT department_id, AVG(salary) AS avg_salary 
FROM emp
GROUP BY department_id
ORDER BY department_id ASC;


15.
SELECT department_id, MAX(salary)
FROM employees
GROUP BY department_id
HAVING MAX(salary) NOT BETWEEN 30000 AND 70000
ORDER BY department_id ASC; 

16.
SELECT COUNT(salary)
FROM employees
WHERE manager_id is null;

17.
SELECT e.department_id, MAX(e.salary) AS third_highest_salary FROM employees AS e
JOIN 
	(SELECT e1.department_id, MAX(e1.salary) AS second_highest_salary 
	FROM employees AS e1
	JOIN 
		(SELECT e2.department_id, MAX(e2.salary) AS max_salary 
		FROM employees AS e2
		GROUP BY department_id) AS max_salaries
		ON e1.department_id = max_salaries.department_id
		AND e1.salary< max_salaries.max_salary
		GROUP BY department_id) AS second_highest_salary
ON e.department_id = second_highest_salary.department_id
AND e.salary < second_highest_salary.second_highest_salary
GROUP BY department_id
ORDER BY department_id;

18.
SELECT em.first_name, em.last_name, em.department_id
FROM employees AS em
JOIN 
(SELECT em1.department_id, AVG(salary) AS avg_salary
FROM employees AS em1
GROUP BY em1.department_id) AS avg_salaries
ON em.department_id = avg_salaries.department_id
WHERE em.salary > avg_salaries.avg_salary
ORDER BY department_id
LIMIT 10;

19
SELECT department_id, SUM(salary)
FROM employees
GROUP BY department_id;

*/

SELECT e.department_id, MAX(e.salary) AS third_highest_salary FROM employees AS e
JOIN 
	(SELECT e1.department_id, MAX(e1.salary) AS second_highest_salary 
	FROM employees AS e1
	JOIN 
		(SELECT e2.department_id, MAX(e2.salary) AS max_salary 
		FROM employees AS e2
		GROUP BY department_id) AS max_salaries
		ON e1.department_id = max_salaries.department_id
		AND e1.salary< max_salaries.max_salary
		GROUP BY department_id) AS second_highest_salary
ON e.department_id = second_highest_salary.department_id
AND e.salary < second_highest_salary.second_highest_salary
GROUP BY department_id
ORDER BY department_id;