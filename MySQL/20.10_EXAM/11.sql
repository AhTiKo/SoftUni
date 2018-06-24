SELECT * FROM (SELECT c.id, c.name, COUNT(uc.user_id) AS contestants
FROM contests AS c
LEFT JOIN users_contests AS uc ON c.id = uc.contest_id
GROUP BY c.id
ORDER BY contestants DESC LIMIT 5) AS rez
ORDER BY rez.contestants  ASC, rez.id ASC;