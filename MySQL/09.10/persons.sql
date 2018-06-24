CREATE DATABASE IF NOT EXISTS relations;

USE relations;

CREATE TABLE IF NOT EXISTS passports(
	passport_id INT PRIMARY KEY AUTO_INCREMENT,
	passport_number VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS persons(
	person_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(20) NOT NULL,
	salary DECIMAL(8,2),
	passport_id INT UNIQUE NOT NULL,
	CONSTRAINT fK_passport_id FOREIGN KEY(passport_id)
   REFERENCES passports(passport_id)
);

INSERT INTO passports(passport_id,passport_number) VALUES(101,'N34FG21B'),(102,'K65LO4R7'),(103,'ZE657QP2');
INSERT INTO persons (person_id,first_name,salary,passport_id) VALUES (1,'Roberto',43300.00,102),(2,'Tom',56100.00,103),(3,'Yana',60200.00,101);


/*
ALTER TABLE passports
ADD PRIMARY KEY passport_id;
UNIQUE(passport_number);

ALTER TABLE persons 
ADD CONSTRAINT fK_passport_id FOREIGN KEY(passport_id)
REFERENCES passports(passport_id), 
PRIMARY KEY (person_id);
*/
