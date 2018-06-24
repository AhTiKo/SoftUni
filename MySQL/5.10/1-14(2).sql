use gringotts;
/*
1.
SELECT count(notes) AS 'count' FROM wizzard_deposits;

2.
SELECT MAX(magic_wand_size) AS 'longest_magic_wand' FROM wizzard_deposits;

3.
SELECT deposit_group, MAX(magic_wand_size) AS 'longest_magic_wand'
 FROM wizzard_deposits
 GROUP BY deposit_group
 ORDER BY longest_magic_wand ASC, deposit_group ASC;

4.
 SELECT deposit_group 
 FROM wizzard_deposits 
 GROUP BY deposit_group
 ORDER BY AVG(magic_wand_size)
 Limit 1; 

SELECT deposit_group, SUM(deposit_amount) AS 'total_sum'
FROM  wizzard_deposits
GROUP BY deposit_group
ORDER BY total_sum ASC;

SELECT deposit_group, SUM(deposit_amount) AS 'total_sum'
FROM  wizzard_deposits 
WHERE magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group
ORDER BY deposit_group ASC;

SELECT deposit_group, SUM(deposit_amount) AS 'total_sum'
FROM  wizzard_deposits 
WHERE magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group
HAVING total_sum <150000
ORDER BY total_sum DESC;

SELECT deposit_group,magic_wand_creator,MIN(deposit_charge) AS 'min_deposit_charge'
FROM wizzard_deposits
GROUP BY magic_wand_creator, deposit_group;

SELECT age , count(id) AS 'wizard_count'
FROM wizzard_deposits
WHERE age BETWEEN 11 AND 20
GROUP BY age AS '[11-20]';


SELECT  
CASE
	WHEN `age` BETWEEN 0 AND 10 THEN '[0-10]'
	WHEN `age` BETWEEN 11 AND 20 THEN '[11-20]'
	WHEN `age` BETWEEN 21 AND 30 THEN '[21-30]'
	WHEN `age` BETWEEN 31 AND 40 THEN '[31-40]'
	WHEN `age` BETWEEN 41 AND 50 THEN '[41-50]'
	WHEN `age` BETWEEN 51 AND 60 THEN '[51-60]'
	WHEN `age` > 60 THEN '[61+]'
END AS 'age_group',
COUNT(*) AS 'wizzard_count'
FROM wizzard_deposits
GROUP BY age_group;


SELECT
 SUM(if(age> 0 AND age < 10,1,0),
 SUM(if(age> 0 AND age < 10,1,0),
 SUM(if(age> 0 AND age < 10,1,0),
 SUM(if(age> 0 AND age < 10,1,0),

FROM wizzard_deposits;

SELECT DISTINCT(SUBSTRING(first_name,1,1)) AS 'first_letter'
FROM wizzard_deposits
WHERE deposit_group = 'Troll Chest'
GROUP BY first_letter
ORDER BY `first_letter`;

11.
SELECT deposit_group, is_deposit_expired , AVG(deposit_interest) AS average_interest
FROM wizzard_deposits
WHERE deposit_start_date > DATE('1985-01-01')
GROUP BY deposit_group,is_deposit_expired
ORDER BY deposit_group DESC,is_deposit_expired ASC;

12.
SELECT SUM(wd1.deposit_amount - 
(SELECT wd2.deposit_amount FROM wizzard_deposits AS `wd2` WHERE wd2.id = wd1.id + 1)) AS sum_difference
FROM wizzard_deposits AS wd1;


SELECT wd.first_name AS 'host_wizzard',
		 wd.deposit_amount AS 'host_amount',
	(SELECT wd1.first_name 
	FROM wizzard_deposits AS wd1
	WHERE wd1.id = wd.id + 1) AS 'guest_wizzard',
		(SELECT wd2.deposit_amount 
	FROM wizzard_deposits AS wd2
	WHERE wd2.id = wd.id + 1) AS 'guest_amount'
FROM wizzard_deposits AS wd;

13.
SELECT department_id, MIN(salary)
FROM employees
WHERE department_id IN(2,5,7)AND hire_date > DATE('2000-01-01')
GROUP BY department_id
ORDER BY department_id ASC;


SELECT deposit_group, is_deposit_expired , AVG(deposit_interest) AS 'average_interest'
WHERE deposit_start_date > '1985-01-01'
FROM wizzard_deposits;
*/

SELECT deposit_group
 FROM wizzard_deposits 
 GROUP BY deposit_group
 ORDER BY AVG(magic_wand_size);