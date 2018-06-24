CREATE DATABASE movies;
use movies;

CREATE TABLE directors(
	id INT PRIMARY KEY AUTO_INCREMENT,
	director_name VARCHAR(20) NOT NULL,
	notes TEXT
);

CREATE TABLE genres(
	id INT PRIMARY KEY AUTO_INCREMENT,
	genre_name VARCHAR(50) NOT NULL,
	notes TEXT
);

CREATE TABLE categories(
	id INT PRIMARY KEY AUTO_INCREMENT,
	category_name VARCHAR(50) NOT NULL,
	notes TEXT
);

CREATE TABLE movies(
	id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(50) NOT NULL,
	director_id INT NOT NULL,
	copyright_year YEAR NOT NULL,
	`length` TIMESTAMP NOT NULL,
	genre_id INT NOT NULL,
	category_id INT NOT NULL,
	rating INT,
	notes TEXT
	
);

INSERT INTO directors(director_name) VALUES('sdsdsd'),('sdsdsd'),('sdsdsd'),('sdsdsd'),('sdsdsd');
INSERT INTO genres(genre_name) VALUES('wswsws'),('wswsws'),('wswsws'),('wswsws'),('wswsws');
INSERT INTO categories(category_name) VALUES('cdcdcd'),('cdcdcd'),('cdcdcd'),('cdcdcd'),('cdcdcd');
INSERT INTO movies(title,director_id,copyright_year,`length`,genre_id,category_id) VALUES('Example title',1,'1999',CURRENT_TIMESTAMP,2,3),('Example title',1,'1999',CURRENT_TIMESTAMP,2,3),('Example title',1,'1999',CURRENT_TIMESTAMP,2,3),('Example title',1,'1999',CURRENT_TIMESTAMP,2,3),('Example title',1,'1999',CURRENT_TIMESTAMP,2,3);
