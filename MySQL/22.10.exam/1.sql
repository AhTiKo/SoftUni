USE report_service;

CREATE TABLE users(
	id INT UNSIGNED PRIMARY KEY,
	username VARCHAR(30) NOT NULL UNIQUE,
	`password` VARCHAR(50) NOT NULL,
	name VARCHAR(50),
	gender VARCHAR(1),
	birthdate DATETIME,
	age INT UNSIGNED,
	email VARCHAR(50) NOT NULL
);

CREATE TABLE departments(
	id INT UNSIGNED PRIMARY KEY,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE employees(
	id INT UNSIGNED PRIMARY KEY,
	first_name VARCHAR(25),
	last_name VARCHAR(25),
	gender VARCHAR(1),
	birthdate DATETIME,
	age INT UNSIGNED,
	department_id INT UNSIGNED,
	CONSTRAINT fk_employees_department_id
	FOREIGN KEY(department_id) REFERENCES departments(id)
);

CREATE TABLE categories(
	id INT UNSIGNED PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	department_id INT UNSIGNED,
	CONSTRAINT fk_categories_department_id
	FOREIGN KEY(department_id) REFERENCES departments(id)
);

CREATE TABLE `status`(
	id INT UNSIGNED PRIMARY KEY,
	label VARCHAR(30) NOT NULL
);

CREATE TABLE reports(
	id INT UNSIGNED PRIMARY KEY,
	category_id INT UNSIGNED,
	status_id INT UNSIGNED,
	open_date DATETIME,
	close_date DATETIME,
	description VARCHAR(200),
	user_id INT UNSIGNED,
	employee_id INT UNSIGNED,
	CONSTRAINT fk_reports_category_id
	FOREIGN KEY(category_id) REFERENCES categories(id),
	CONSTRAINT fk_reports_status_id
	FOREIGN KEY(status_id) REFERENCES `status`(id),
	CONSTRAINT fk_reports_users_id
	FOREIGN KEY(user_id) REFERENCES users(id),
	CONSTRAINT fk_reports_employee_id
	FOREIGN KEY(employee_id) REFERENCES employees(id)
);