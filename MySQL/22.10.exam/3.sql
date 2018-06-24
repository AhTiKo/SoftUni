USE report_service;
/*
3.
UPDATE reports
SET status_id = 2
WHERE status_id = 1 AND category_id = 4;
4.
DELETE FROM reports
WHERE status_id = 4;
5.
SELECT u.username, u.age
FROM users AS u
ORDER BY u.age ASC, u.username DESC;
6.
SELECT r.description, r.open_date
FROM reports AS r 
WHERE r.employee_id IS NULL
ORDER BY r.open_date ASC,r.description ASC;
7.
SELECT e.first_name,e.last_name,r.description, DATE_FORMAT(r.open_date,'%Y-%m-%d') AS open_date
FROM employees AS e
JOIN reports AS r ON r.employee_id = e.id
ORDER BY r.employee_id ASC, r.open_date ASC, r.id ASC;
8.
SELECT c.name, COUNT(r.id) AS reports_number
FROM categories AS c
JOIN reports AS r ON r.category_id = c.id
GROUP BY c.id
ORDER BY reports_number ASC, c.name ASC;
9.
SELECT c.name, COUNT(e.id) AS employees_number
FROM categories AS c
JOIN departments AS d ON d.id = c.department_id
JOIN employees AS e ON e.department_id = d.id
GROUP BY c.id
ORDER BY c.name ASC;
10.
SELECT DISTINCT(c.name)
FROM categories AS c
JOIN reports AS r ON r.category_id = c.id
JOIN users AS u ON r.user_id = u.id
WHERE DAYOFYEAR(u.birthdate) = DAYOFYEAR(r.open_date)
ORDER BY c.name ASC
11.
SELECT CONCAT(e.first_name,' ',e.last_name) AS name, COUNT(r.user_id) AS users_count
FROM employees AS e
LEFT JOIN reports AS r ON r.employee_id = e.id
GROUP BY e.id
ORDER BY users_count DESC, name ASC;
12.
SELECT r.open_date,r.description,u.email AS reporter_email
FROM reports AS r
JOIN users AS u ON r.user_id = u.id
JOIN categories AS c ON r.category_id = c.id
JOIN departments AS d ON d.id = c.department_id
WHERE r.close_date IS NULL
AND CHAR_LENGTH(r.description) > 20
AND r.description LIKE '%str%'
AND d.name IN ('Infrastructure', 'Emergency', 'Roads Maintenance')
ORDER BY r.open_date ASC, reporter_email ASC, r.id ASC;
13.
SELECT DISTINCT(u.username)
FROM users AS u
JOIN reports AS r ON r.user_id = u.id
WHERE LEFT(u.username,1) IN (SELECT r1.category_id FROM reports AS r1 WHERE r1.user_id = r.user_id)
OR RIGHT(u.username,1) IN (SELECT r1.category_id FROM reports AS r1 WHERE r1.user_id = r.user_id)
ORDER BY u.username;

SELECT CONCAT(e.first_name,' ', last_name) AS name, r.open_date,r.close_date
FROM employees AS e
JOIN reports AS r ON r.employee_id = e.id
WHERE YEAR(r.open_date) <= 2016 AND YEAR(r.close_date) >= 2016

15.
SELECT d.name AS department_name , IF(AVG(DATEDIFF(r.close_date,r.open_date)) IS NULL ,'no info',FLOOR(AVG(DATEDIFF(r.close_date,r.open_date)))) AS average_duration
FROM departments AS d
JOIN categories AS c ON c.department_id = d.id
JOIN reports AS r ON r.category_id = c.id
GROUP BY d.id
ORDER BY d.name;
*/
SELECT rez.department_name, rez.category_name, rez.num/sum(rez.num)
FROM  (SELECT d.name AS department_name, c.name AS category_name, COUNT(r.id) AS num
FROM departments AS d
JOIN categories AS c ON c.department_id = d.id
JOIN reports AS r ON r.category_id = c.id
GROUP BY d.id,c.id
ORDER BY d.name) AS rez
GROUP BY rez.department_name

