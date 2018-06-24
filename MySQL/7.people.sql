USE minions;
CREATE TABLE people(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(200) NOT NULL,
	picture MEDIUMBLOB,
	height DOUBLE(3,2),
	weight DOUBLE(5,2),
	gender CHAR NOT NULL CHECK (gender in('f','m')),
	birthdate DATE NOT NULL,
	biography TEXT
);
INSERT INTO people(name,picture,height,weight,gender,birthdate,biography) VALUES ('Pesho',NULL,1.94,100.00,'m',12/01/1990,NULL),
('Minka',NULL,2.10,120.00,'f',14/06/2003,NULL),('Samat',NULL,1.94,100.00,'m',01/10/1990,NULL),('Prokopi',NULL,1.94,100.00,'m',01/01/2001,NULL),
('Penka',NULL,1.94,100.00,'f',14/12/2000,NULL);