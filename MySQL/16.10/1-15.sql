USE soft_uni;
DELIMITER $$
/*
1.
CREATE PROCEDURE usp_get_employees_salary_above_35000()
BEGIN 
	SELECT e.first_name,e.last_name
	FROM employees AS e
	WHERE e.salary > 35000
	ORDER BY e.first_name ASC, e.last_name ASC;
END $$

CALL usp_get_employees_salary_above_35000();

2.
CREATE PROCEDURE usp_get_employees_salary_above(salary_param DECIMAL(19,4))
BEGIN 
	SELECT e.first_name,e.last_name
	FROM employees AS e
	WHERE e.salary >= salary_param
	ORDER BY e.first_name ASC, e.last_name ASC, e.employee_id ASC;
END $$

CALL usp_get_employees_salary_above(48100);

3.
CREATE PROCEDURE usp_get_towns_starting_with(town_name_param VARCHAR(50))
BEGIN 
	SELECT t.name AS town_name
	FROM towns AS t
	WHERE t.name LIKE CONCAT(town_name_param,'%')
	ORDER BY t.name ASC;
END $$

CALL usp_get_towns_starting_with('b');

4.
CREATE PROCEDURE usp_get_employees_from_town(town_name_param VARCHAR(50))
BEGIN 
	SELECT e.first_name, e.last_name
	FROM employees AS e
		JOIN addresses AS a ON a.address_id = e.address_id
		JOIN towns AS t ON t.town_id = a.town_id
	WHERE t.name = town_name_param
	ORDER BY e.first_name ASC, e.last_name ASC, e.employee_id ASC;
END $$

CALL usp_get_employees_from_town('Sofia');

5.
CREATE FUNCTION ufn_get_salary_level(salary_param DECIMAL(19,4))
RETURNS VARCHAR(10)
BEGIN
	DECLARE salary_level VARCHAR(10);
	SET salary_level := (IF(salary_param < 30000, 'Low',IF(salary_param >50000,'High','Average')));
	RETURN salary_level;
END$$

SELECT ufn_get_salary_level(13500);

6.
CREATE PROCEDURE usp_get_employees_by_salary_level(salary_level_param VARCHAR(10))
BEGIN 
	SELECT e.first_name, e.last_name
	FROM employees AS e
	WHERE (SELECT ufn_get_salary_level(e.salary)) = salary_level_param
	ORDER BY e.first_name DESC, e.last_name DESC;
END $$

7.
CREATE FUNCTION ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))
RETURNS INT
BEGIN
	DECLARE result INT DEFAULT 1;
	DECLARE i INT DEFAULT 1;
	WHILE i <= CHAR_LENGTH(word) DO
		IF(SELECT(LOCATE(SUBSTRING(word,i,1),set_of_letters)) = 0) THEN 
		SET result := 0;
		END IF;
		SET i := i+1;
	END WHILE;
	RETURN result;
END;

SELECT ufn_is_word_comprised('oistmiahf','Sofia');

8.
CREATE PROCEDURE usp_get_holders_full_name()
BEGIN
	SELECT CONCAT(ah.first_name,' ',ah.last_name) AS full_name
	FROM account_holders AS ah
	ORDER BY full_name ASC, ah.id ASC; 
END $$

9.
CREATE PROCEDURE usp_get_holders_with_balance_higher_than(balance_param DECIMAL(19,4))
BEGIN
	SELECT ah.first_name,ah.last_name
	FROM account_holders AS ah
		JOIN accounts AS a ON a.account_holder_id = ah.id
	GROUP BY ah.id
	HAVING SUM(a.balance) > balance_param
	ORDER BY a.id ASC;
END $$

10.
CREATE FUNCTION ufn_calculate_future_value2(sum_param DECIMAL(19,4), yearly_interest_rate DECIMAL(19,4),number_of_years INT)
RETURNS DECIMAL(19,4)
BEGIN
	DECLARE result DECIMAL(19,4);
	SET result := sum_param * (POW((1+yearly_interest_rate),number_of_years));
	RETURN result;
END $$

SELECT ufn_calculate_future_value(1000, 0.1, 5);

CREATE FUNCTION ufn_calculate_future_value2(sum_param DECIMAL(19,4), yearly_interest_rate DECIMAL(19,4),number_of_years INT)
RETURNS DECIMAL(19,4)
BEGIN
	DECLARE result DECIMAL(19,4);
	SET result := sum_param * (POW((1+yearly_interest_rate),number_of_years));
	RETURN result;
END $$

11.
CREATE PROCEDURE usp_calculate_future_value_for_account (account_id_param INT, interest_rate DECIMAL(19,4))
BEGIN
	SELECT a.id, ah.first_name, ah.last_name, a.balance AS current_balance,(SELECT ufn_calculate_future_value2(a.balance, interest_rate, 5)) AS balance_in_5_years
	FROM accounts AS a
	JOIN account_holders AS ah ON a.account_holder_id = ah.id
	WHERE a.id = account_id_param;
END $$

CALL usp_calculate_future_value_for_account(1,0.1);

12.
CREATE PROCEDURE usp_deposit_money(account_id INT, money_amount DECIMAL(19,4)) 
BEGIN 
	IF (money_amount > 0) THEN 
	UPDATE accounts 
	SET balance = balance + money_amount
	WHERE id = account_id;
	END IF;
	SELECT * FROM accounts
	WHERE id = account_id;
END $$

CALL usp_deposit_money(1,10);

13.
CREATE PROCEDURE usp_withdraw_money(account_id INT, money_amount DECIMAL(19,4)) 
BEGIN 
	IF (money_amount > 0) AND ((SELECT balance FROM accounts WHERE id = account_id ) - money_amount >= 0)  THEN 
	UPDATE accounts 
	SET balance = balance - money_amount
	WHERE id = account_id;
	END IF;
	SELECT * FROM accounts
	WHERE id = account_id;
END $$

CALL usp_withdraw_money(1,120);


CREATE PROCEDURE usp_transfer_money(from_account_id INT, to_account_id INT, amount DECIMAL(19,4))
BEGIN
	START TRANSACTION;
	SET @temp_balance = (SELECT ac.balance 
								FROM accounts AS ac
								WHERE ac.id = from_account_id);
	CALL usp_withdraw_money(from_account_id,amount);
	IF ((SELECT balance FROM accounts WHERE id = from_account_id) + amount != @temp_balance) THEN 
		ROLLBACK;
	ELSE SET @temp_balance = (SELECT balance 
									FROM accounts 
									WHERE id = to_account_id);
		CALL usp_deposit_money(to_account_id,amount);
		IF((SELECT balance FROM accounts WHERE id = to_account_id) - amount != @temp_balance) THEN
			ROLLBACK;
		END IF;
	END IF;
	COMMIT;
END$$

CALL usp_transfer_money(1,2,4000);

CREATE PROCEDURE usp_transfer_money2(from_account_id INT, to_account_id INT, amount DECIMAL(19,4))
BEGIN
	START TRANSACTION;
	SET @temp_balance = (SELECT ac.balance 
								FROM accounts AS ac
								WHERE ac.id = from_account_id);
	IF (amount > 0) AND (@temp_balance - amount >= 0)  THEN 
		UPDATE accounts 
		SET balance = balance - amount
		WHERE id = from_account_id;
	END IF;
	IF ((SELECT balance FROM accounts WHERE id = from_account_id) + amount != @temp_balance) OR (from_account_id = to_account_id)  THEN 
		ROLLBACK;
	ELSE SET @temp_balance = (SELECT balance 
									FROM accounts 
									WHERE id = to_account_id);
			UPDATE accounts 
			SET balance = balance + amount
			WHERE id = to_account_id;
		IF((SELECT balance FROM accounts WHERE id = to_account_id) - amount != @temp_balance) THEN
			ROLLBACK;
		ELSE 
			COMMIT;
		END IF;
	END IF;
END$$


CREATE PROCEDURE usp_transfer_money(from_account_id INT, to_account_id INT, amount DECIMAL(19,4))
BEGIN
	START TRANSACTION;
	IF ((amount > 0) AND 
	((SELECT balance FROM accounts WHERE id = from_account_id) - amount >= 0) AND 
	(from_account_id != to_account_id)) THEN 
		UPDATE accounts 
		SET balance = balance - amount
		WHERE id = from_account_id;
		UPDATE accounts 
		SET balance = balance + amount
		WHERE id = to_account_id;
	END IF;
	IF(((SELECT balance FROM accounts WHERE id = from_account_id) + amount) <> ((SELECT balance FROM accounts WHERE id = to_account_id) - amount)) THEN
		ROLLBACK;
	END IF;
	COMMIT;
END$$

14.(final version)
CREATE PROCEDURE usp_transfer_money(from_account_id INT, to_account_id INT, amount DECIMAL(19,4))
BEGIN
	DECLARE stat INT;
	START TRANSACTION;
	SET stat := 1;
	IF(SELECT COUNT(*) FROM accounts WHERE id IN (from_account_id,to_account_id)) < 2 THEN SET stat = 0;
	END IF;
	IF amount < 0 THEN SET stat = 0;
	END IF;
	IF(SELECT balance FROM accounts WHERE id = from_account_id) < amount THEN SET stat = 0;
	END IF;
	UPDATE accounts 
	SET balance = balance - amount
	WHERE id = from_account_id;
	UPDATE accounts 
	SET balance = balance + amount
	WHERE id = to_account_id;
	IF stat = 0 THEN ROLLBACK;
	ELSE COMMIT;
	END IF;
END$$


CREATE TABLE `logs`(
	log_id INT PRIMARY KEY AUTO_INCREMENT,
	account_id INT NOT NULL,
	old_sum DECIMAL(19,4),
	new_sum	DECIMAL(19,4)
);
*/

CREATE TRIGGER tr_updated_accounts
BEFORE UPDATE ON accounts 
FOR EACH ROWS
BEGIN
	INSERT INTO `logs`(account_id,old_sum,new_sum) VALUES (NEW.id,OLD.balance,NEW.balance);
END $$