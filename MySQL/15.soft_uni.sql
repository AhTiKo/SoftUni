CREATE DATABASE IF NOT EXISTS soft_uni;
USE soft_uni;

CREATE TABLE towns (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL
);

CREATE TABLE addresses(
	id INT PRIMARY KEY AUTO_INCREMENT,
	address_text VARCHAR(100) NOT NULL,
	town_id INT,
	CONSTRAINT fk_town_id
	FOREIGN KEY (town_id) REFERENCES towns(id)
);

CREATE TABLE departments(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE employees(
	id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(20) NOT NULL,
	middle_name VARCHAR(20),
	last_name VARCHAR(20) NOT NULL,
	job_title VARCHAR(50) NOT NULL,
	department_id INT,
	hire_date DATETIME NOT NULL,
	salary DOUBLE,
	address_id INT,
	CONSTRAINT fk_department_id
	FOREIGN KEY (department_id) REFERENCES departments(id),
	CONSTRAINT fk_address_id
	FOREIGN KEY (address_id) REFERENCES addresses(id)
);