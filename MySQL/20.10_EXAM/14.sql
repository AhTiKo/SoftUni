SELECT c.id,c.name,COUNT(s.id) AS 'submissions'
FROM contests AS c
JOIN problems AS p ON p.contest_id = c.id
JOIN users_contests AS uc ON c.id = uc.contest_id 
JOIN submissions AS s ON s.problem_id = p.id
WHERE s.user_id = uc.user_id
GROUP BY c.id
ORDER BY `submissions` DESC, c.id ASC;