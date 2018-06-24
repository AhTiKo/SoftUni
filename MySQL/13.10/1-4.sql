USE soft_uni;
/*
1.
DELIMITER $$
CREATE FUNCTION ufn_count_employees_by_town(town_name VARCHAR(20))
RETURNS INT
BEGIN
	DECLARE count_emp INT;

		SET count_emp = (SELECT COUNT(e.employee_id)
						FROM employees AS e
						JOIN addresses AS a ON e.address_id = a.address_id
						JOIN towns AS t ON a.town_id = t.town_id
						WHERE t.name = town_name);

		RETURN count_emp;
END $$

SELECT ufn_count_employees_by_town('Sofia') AS `count`;

2.
DELIMITER $$

CREATE PROCEDURE usp_raise_salaries(department_name VARCHAR(20)) 
BEGIN 
UPDATE employees AS e
SET e.salary = e.salary*1.05
WHERE e.department_id = (SELECT d.department_id FROM departments AS d WHERE d.name = department_name);
END $$

CALL usp_raise_salaries('Production');

4.
CREATE TABLE deleted_employees(
	employee_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	middle_name VARCHAR(20),
	job_title VARCHAR(50),
	department_id INT,
	salary DOUBLE 
);

CREATE TRIGGER tr_deleted_employees
AFTER DELETE
ON employees
FOR EACH ROW
BEGIN
	INSERT INTO deleted_employees     (first_name,last_name,middle_name,job_title,department_id,salary)
	VALUES(OLD.first_name,OLD.last_name,OLD.middle_name,OLD.job_title,OLD.department_id,OLD.salary);
END;
*/