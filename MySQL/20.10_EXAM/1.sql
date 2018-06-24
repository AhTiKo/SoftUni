USE cjs_database;

CREATE TABLE users(
	id INT PRIMARY KEY,
	username VARCHAR(30) NOT NULL UNIQUE,
	`password` VARCHAR(30) NOT NULL,
	email VARCHAR(50)
);

CREATE TABLE categories(
	id INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	parent_id INT,
	CONSTRAINT fk_categories_parent_id
	FOREIGN KEY(parent_id) REFERENCES categories(id)
);

CREATE TABLE contests(
	id INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	category_id INT,
	CONSTRAINT fk_contests_categorie_id
	FOREIGN KEY(category_id) REFERENCES categories(id)
);

CREATE TABLE problems(
	id INT PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	points INT NOT NULL,
	tests INT DEFAULT 0,
	contest_id INT,
	CONSTRAINT fk_problems_contest_id
	FOREIGN KEY(contest_id) REFERENCES contests(id)
);

CREATE TABLE submissions(
	id INT PRIMARY KEY  AUTO_INCREMENT,
	passed_tests INT NOT NULL,
	problem_id INT,
	user_id INT,
	CONSTRAINT fk_submissions_problem_id
	FOREIGN KEY(problem_id) REFERENCES problems(id),
	CONSTRAINT fk_submissions_user_id
	FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE users_contests(
	user_id INT,
	contest_id INT,
	CONSTRAINT pk_users_contests PRIMARY KEY (user_id,contest_id),
	CONSTRAINT fk_users_contests_user_id
	FOREIGN KEY(user_id) REFERENCES users(id),
	CONSTRAINT fk_users_contests_contest_id
	FOREIGN KEY(contest_id) REFERENCES contests(id)
);
