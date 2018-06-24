USE soft_uni;
/*
1.
SELECT e.employee_id, e.job_title, e.address_id, a.address_text
FROM employees AS e
INNER JOIN addresses AS a
ON e.address_id = a.address_id
ORDER BY address_id ASC
LIMIT 5;
2.
SELECT e.first_name, e.last_name, t.name, a.address_text
FROM employees AS e
INNER JOIN addresses AS a ON e.address_id = a.address_id
INNER JOIN towns AS t ON a.town_id = t.town_id
ORDER BY e.first_name ASC, e.last_name ASC
LIMIT 5;
3.
SELECT e.employee_id, e.first_name, e.last_name ,d.name AS department_name
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
WHERE d.name = 'Sales'
ORDER BY e.employee_id DESC;
4.
SELECT e.employee_id, e.first_name, e.salary, d.name AS department_name
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
WHERE e.salary > 15000 
ORDER BY e.department_id DESC
LIMIT 5;
5.
SELECT e.employee_id, e.first_name
FROM employees AS e
LEFT JOIN employees_projects AS ep
ON e.employee_id = ep.employee_id
WHERE ep.project_id IS NULL
ORDER BY e.employee_id DESC
LIMIT 3;
6.
SELECT e.first_name, e.last_name, e.hire_date, d.name AS dept_name
FROM employees AS e
JOIN departments AS d
ON e.department_id = d.department_id
WHERE e.hire_date >= DATE('1999-01-02') AND d.name IN ('Sales','Finance')
ORDER BY e.hire_date ASC;
7.
SELECT e.employee_id, e.first_name, p.name AS project_name
FROM employees AS e
INNER JOIN employees_projects AS ep ON e.employee_id = ep.employee_id
INNER JOIN projects AS p ON ep.project_id = p.project_id
WHERE p.start_date >= DATE('2002-08-14') AND p.end_date IS NULL
ORDER BY e.first_name ASC,project_name ASC
LIMIT 5;
8.
SELECT e.employee_id, e.first_name, IF(p.start_date >= DATE('2005-01-01'),NULL,p.name) AS project_name
FROM employees AS e
INNER JOIN employees_projects AS ep ON e.employee_id = ep.employee_id
INNER JOIN projects AS p ON ep.project_id = p.project_id
WHERE e.employee_id = 24
ORDER BY project_name ASC;
9.
SELECT e.employee_id, e.first_name, e.manager_id,
(SELECT e1.first_name FROM employees AS e1 WHERE e1.employee_id = e.manager_id) AS manager_name
FROM employees AS e
WHERE e.manager_id IN (3,7)
ORDER BY e.first_name ASC;
10.
SELECT e.employee_id, CONCAT(e.first_name,' ',e.last_name) AS employee_name, 
(SELECT CONCAT(e1.first_name,' ',e1.last_name) FROM employees AS e1 WHERE e1.employee_id = e.manager_id) AS manager_name ,
d.name AS department_name
FROM employees AS e
INNER JOIN departments AS d ON e.department_id = d.department_id
WHERE e.manager_id IS NOT NULL
ORDER BY e.employee_id ASC
LIMIT 5;
11.
SELECT MIN(rez.avr_salary) AS min_average_salary
FROM (SELECT AVG(salary) AS avr_salary ,department_id FROM employees GROUP BY department_id) AS rez;
*/