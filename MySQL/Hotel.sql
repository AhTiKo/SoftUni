CREATE DATABASE hotel;
use hotel;
CREATE TABLE employees(
id INT PRIMARY KEY AUTO_INCREMENT, 
first_name VARCHAR(20) NOT NULL, 
last_name VARCHAR(20) NOT NULL, 
title VARCHAR(20) NOT NULL, 
notes TEXT
);

CREATE TABLE customers(
account_number INT PRIMARY KEY AUTO_INCREMENT, 
first_name VARCHAR(20) NOT NULL, 
last_name VARCHAR(20) NOT NULL, 
phone_number VARCHAR(20), 
emergency_name VARCHAR(20),
emergency_number VARCHAR(20), 
notes TEXT
);

CREATE TABLE room_status(
id INT PRIMARY KEY AUTO_INCREMENT,
room_status VARCHAR(20) NOT NULL, 
notes TEXT
);

CREATE TABLE room_types(
id INT PRIMARY KEY AUTO_INCREMENT,
room_type VARCHAR(20) NOT NULL,
notes TEXT
);

CREATE TABLE bed_types(
id INT PRIMARY KEY AUTO_INCREMENT,
bed_type VARCHAR(20) NOT NULL,
notes TEXT
);

CREATE TABLE rooms(
room_number INT PRIMARY KEY, 
room_type INT NOT NULL, 
bed_type INT NOT NULL, 
rate INT, 
room_status INT NOT NULL, 
notes TEXT
);

CREATE TABLE payments(
id INT PRIMARY KEY AUTO_INCREMENT, 
employee_id INT NOT NULL, 
payment_date DATE NOT NULL, 
account_number INT NOT NULL, 
first_date_occupied DATE NOT NULL,
last_date_occupied DATE NOT NULL, 
total_days INT NOT NULL, 
amount_charged BOOL NOT NULL,
tax_rate DECIMAL(10,2), 
tax_amount DECIMAL (10,2), 
payment_total DECIMAL(10,2),
notes TEXT
);

CREATE TABLE occupancies(
id INT PRIMARY KEY AUTO_INCREMENT, 
employee_id INT NOT NULL, 
date_occupied DATE NOT, 
account_number INT NOT NULL, 
room_number INT NOT NULL, 
rate_applied INT,
phone_charge DECIMAL, 
notes TEXT
);