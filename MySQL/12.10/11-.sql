USE geography;
/*
12.
SELECT c.country_code, m.mountain_range, p.peak_name, p.elevation
FROM countries AS c
INNER JOIN mountains_countries AS mc ON c.country_code = mc.country_code
INNER JOIN mountains AS m ON mc.mountain_id = m.id
INNER JOIN peaks AS p ON mc.mountain_id = p.mountain_id
WHERE c.country_name = 'Bulgaria' AND p.elevation > 2835
ORDER BY p.elevation DESC;
13.
SELECT c.country_code, COUNT(c.country_code) AS mountain_range
FROM countries AS c
INNER JOIN mountains_countries AS mc ON c.country_code = mc.country_code
INNER JOIN mountains AS m ON mc.mountain_id = m.id
WHERE c.country_name IN('United States','Russia','Bulgaria')
GROUP BY c.country_code
ORDER BY mountain_range DESC;
*/
SELECT 