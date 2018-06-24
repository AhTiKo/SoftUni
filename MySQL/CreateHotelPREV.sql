CREATE TABLE hotel;
use hotel;
CREATE TABLE employees(
	id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	title VARCHAR(50) NOT NULL,
	notes TEXT
);

CREATE TABLE customers(
	account_number INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	phone_number VARCHAR(15) NOT NULL,
	emergency_name VARCHAR(20) NOT NULL,
	emergency_number VARCHAR(20) NOT NULL,
	notes TEXT
);

CREATE TABLE room_status(
	room_status INT PRIMARY KEY AUTO_INCREMENT,
	notes TEXT
);

CREATE TABLE room_types(
	room_type INT PRIMARY KEY AUTO_INCREMENT,
	notes TEXT
);


CREATE TABLE bed_types(
	bed_type INT PRIMARY KEY AUTO_INCREMENT,
	notes TEXT
);

CREATE TABLE rooms(
	room_number INT PRIMARY KEY AUTO_INCREMENT,
	room_type VARCHAR(20) NOT NULL,
	bed_type VARCHAR(20) NOT NULL,
	rate VARCHAR(20) NOT NULL,
	room_status VARCHAR(10),
	notes TEXT
);

CREATE TABLE payments(
	id INT PRIMARY KEY AUTO_INCREMENT,
	employee_id INT NOT NULL,
	payment_date DATETIME NOT NULL,
	account_number VARCHAR(20) NOT NULL,
	first_date_occupied DATETIME NOT NULL,
	last_date_occupied DATETIME NOT NULL,
	total_days INT NOT NULL,
	amount_charged DOUBLE(6,2) ,
	tax_rate DOUBLE(6,2),
	tax_amount DOUBLE(6,2),
	payment_total DOUBLE(6,2),
	notes TEXT
);

CREATE TABLE occupancies(
	id INT PRIMARY KEY AUTO_INCREMENT,
	employee_id INT NOT NULL,
	date_occupied DATETIME NOT NULL,
	account_number VARCHAR(15) NOT NULL,
	room_number INT NOT NULL,
	rate_applied VARCHAR(15) NOT NULL,
	phone_charge VARCHAR(15) NOT NULL,
	notes TEXT
);

INSERT INTO employees (id, first_name, last_name, title, notes) 
	VALUES ('1', 'GORGE', 'MINOLE3', 'GAMEBAR1','Hello world'),
		 	 ('2', 'GORGE2', 'MINOLE3', 'GAMEBAR2','Hello world'),
			 ('3', 'GORGE3', 'MINOLE3', 'GAMEBAR3','Hello world');

INSERT INTO customers (account_number, first_name, last_name, phone_number,emergency_name, emergency_number, notes) 
	VALUES ('1', '21GORGE', 'M2INOLE3', 'GAMEBAR1','02K3568478','emer211ge', 'Hello world'),
			 ('2', '1GORGE2', 'M2INOLE3', 'GAMEBAR2','023JK568478','emer21ge', 'Hello world'),
			 ('3', '1GORGE3', 'M2INOLE3', 'GAMEBAR3','02JK3568478','eme21rge', 'Hello world');

INSERT INTO room_status (room_status, notes) 
	VALUES ('1','Hello world'),
			 ('2','Hello world'),
			 ('3','Hello world');

INSERT INTO room_types (room_type, notes) 
	VALUES ('1','Hello world'),
			 ('2','Hello world'),
			 ('3','Hello world');

INSERT INTO bed_types (bed_type, notes) 
	VALUES ('1','Hello world'),
			 ('2','Hello world'),
			 ('3','Hello world');

INSERT INTO rooms (room_number, room_type, bed_type, rate, room_status, notes) 
	VALUES ('1', 'doubles', 'one', 'HU5','free', 'Hello world'),
			 ('2', 'doubles', 'one', 'HY5','closed', 'Hello world'),
			 ('3', 'doubles', 'one', 'HY5','open', 'Hello world');

INSERT INTO payments (id, employee_id, payment_date, account_number,first_date_occupied, last_date_occupied, total_days, amount_charged, tax_rate, tax_amount, payment_total, notes) 
	VALUES ('1', '23', '9999-12-31 23:59:59', '201','9999-12-31 23:59:59','9999-12-31 23:59:59', '2', NULL, NULL, NULL,NULL, 'Hello world'),
			 ('2', '23', '9999-12-31 23:59:59', '201','9999-12-31 23:59:59','9999-12-31 23:59:59', '2', NULL, NULL, NULL,NULL, 'Hello world'),
			 ('3', '23', '9999-12-31 23:59:59', '201','9999-12-31 23:59:59','9999-12-31 23:59:59', '2', NULL, NULL, NULL,NULL, 'Hello world');
					 							 							 							 

INSERT INTO occupancies (id, employee_id, date_occupied, account_number,room_number, rate_applied, phone_charge, notes) 
	VALUES ('1', '23', '9999-12-31 23:59:59','023568478','21', '10','YES', 'Hello world'),
			 ('2', '22', '9999-12-31 23:59:59','023568478','202', '10', 'NO', 'Hello world'),
			 ('3', '25', '9999-12-31 23:59:59','023568478','225', '10', 'NO', 'Hello world');