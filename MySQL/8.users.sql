USE minions;
CREATE TABLE users(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(30) NOT NULL,
	`password` VARCHAR(26) NOT NULL,
	profile_picture BLOB ,
	last_login_time TIMESTAMP ,
	is_deleted BOOLEAN,
	CONSTRAINT uc_username UNIQUE (username)
);

INSERT INTO users(username,`password`) VALUES ('asdf','pass'),('as2df','pass'),('as1df','pass'),('asd5f','pass'),('as7df','pass');
