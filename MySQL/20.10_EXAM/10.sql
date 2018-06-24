SELECT u.id,u.username,u.`password`
FROM users AS u
WHERE u.`password` IN (SELECT u1.`password`
								FROM users AS u1
								WHERE u1.id != u.id)
ORDER BY u.username ASC,u.id ASC;