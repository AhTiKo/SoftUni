
INSERT INTO submissions (passed_tests,problem_id,user_id)
	SELECT CEIL(SQRT(POW(CHAR_LENGTH(p.name),3))-CHAR_LENGTH(p.name)) AS passed_tests, p.id AS problem_id, CEIL((3 * p.id)/2) AS user_id
	FROM problems AS p
	WHERE id BETWEEN 1 AND 10;