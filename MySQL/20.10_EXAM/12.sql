SELECT s.id, u.username, p.name, CONCAT(s.passed_tests,' / ',p.tests) AS result
FROM submissions AS s
JOIN users AS u ON s.user_id = u.id
JOIN problems AS p ON s.problem_id = p.id
WHERE u.id = (SELECT u.id
FROM users AS u
JOIN users_contests AS us ON us.user_id = u.id
GROUP BY u.id
ORDER BY COUNT(us.contest_id) DESC
LIMIT 1)
ORDER BY s.id DESC;