USE hospital;

SELECT id AS `No.`,concat(first_name,' ',last_name) AS `Full name`,
job_title AS `Job Title`, salary FROM employees WHERE employees.salary>1000 ORDER BY salary LIMIT 5;

