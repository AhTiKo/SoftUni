USE diablo;
/*
SELECT `name`,DATE_FORMAT(`start`,'%Y-%m-%d') FROM games AS g
WHERE YEAR(`start`) >=2011 AND YEAR(`start`)<=2012
ORDER BY `start`,name LIMIT 50;

SELECT user_name, SUBSTRING_INDEX(email,'@',-1) AS `Email Provider`
FROM users
ORDER BY `Email Provider` ASC , user_name;

SELECT user_name, ip_address FROM users WHERE ip_address LIKE '___.1%.%.___' ORDER BY user_name ASC;

SELECT name as 'Game',
 if(HOUR(`start`)< 12,'Morning',if(HOUR(`start`)<18,'Afternoon','Evening')) AS 'Part of the day',
 if(duration <=3, 'Extra Short',if(duration<=6,'Short',if(duration<=10,'Long','Extra Long'))) AS 'Duration' FROM games ORDER BY name;

SELECT name AS 'Game',
CASE
WHEN TIME('start') BETWEEN 0 AND 11 THEN 'Morning'
WHEN TIME('start') BETWEEN 12 AND 17 THEN 'Afternoon'
WHEN TIME('start') BETWEEN 18 AND 23 THEN 'Evening'
END AS 'Part ot the day',
CASE
WHEN duration <=3  THEN 'Extra Short'
WHEN duration <=3  THEN 'Short'
WHEN duration <=3  THEN 'Long'
WHEN duration <=3  THEN 'Extra Long'

*/