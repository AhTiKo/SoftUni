USE report_service;

CREATE TABLE users(
	id INT(11) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(30) NOT NULL UNIQUE,
	`password` VARCHAR(50) NOT NULL,
	name VARCHAR(50),
	gender VARCHAR(1),
	birthdate DATETIME,
	age INT(11) UNSIGNED,
	email VARCHAR(50) NOT NULL
);

CREATE TABLE departments(
	id INT(11) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE employees(
	id INT(11) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(25),
	last_name VARCHAR(25),
	gender VARCHAR(1),
	birthdate DATETIME,
	age INT(11) UNSIGNED,
	department_id INT(11) UNSIGNED NOT NULL,
	CONSTRAINT fk_employees_department_id
	FOREIGN KEY(department_id) REFERENCES departments(id)
);

CREATE TABLE categories(
	id INT(11) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	department_id INT(11) UNSIGNED,
	CONSTRAINT fk_categories_department_id
	FOREIGN KEY(department_id) REFERENCES departments(id)
);

CREATE TABLE `status`(
	id INT(11) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	label VARCHAR(30) NOT NULL
);

CREATE TABLE reports(
	id INT(11) UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	category_id INT(11) UNSIGNED NOT NULL,
	status_id INT(11) UNSIGNED NOT NULL,
	open_date DATETIME NOT NULL,
	close_date DATETIME,
	description VARCHAR(200),
	user_id INT(11) UNSIGNED NOT NULL,
	employee_id INT(11) UNSIGNED,
	CONSTRAINT fk_reports_category_id
	FOREIGN KEY(category_id) REFERENCES categories(id),
	CONSTRAINT fk_reports_status_id
	FOREIGN KEY(status_id) REFERENCES `status`(id),
	CONSTRAINT fk_reports_users_id
	FOREIGN KEY(user_id) REFERENCES users(id),
	CONSTRAINT fk_reports_employee_id
	FOREIGN KEY(employee_id) REFERENCES employees(id)
);