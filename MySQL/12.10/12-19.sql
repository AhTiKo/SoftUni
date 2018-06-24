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
14.
SELECT c.country_name, r.river_name
FROM countries AS c
LEFT JOIN countries_rivers AS cr ON c.country_code = cr.country_code
LEFT JOIN rivers AS r ON cr.river_id = r.id
JOIN continents AS cont ON c.continent_code = cont.continent_code
WHERE cont.continent_name = 'Africa'
ORDER BY c.country_name ASC
LIMIT 5;
15.
SELECT c.continent_code, c.currency_code, COUNT(c.currency_code) AS currency_usage
FROM countries AS c
GROUP BY c.currency_code,c.continent_code
HAVING currency_usage = 
(SELECT COUNT(c1.country_code) AS max_count
FROM countries AS c1
WHERE c1.continent_code = c.continent_code
GROUP BY c1.currency_code 
HAVING max_count > 1
ORDER BY max_count DESC
LIMIT 1)
ORDER BY c.continent_code,c.currency_code;

16.
SELECT COUNT(c.country_code) AS country_count
FROM countries AS c
LEFT JOIN mountains_countries AS mc ON c.country_code = mc.country_code
WHERE mc.mountain_id IS NULL;
17.
SELECT c.country_name, MAX(p.elevation) AS highest_peak_elevation, MAX(r.`length`) AS longest_river_length
FROM countries AS c
LEFT JOIN mountains_countries AS mc ON c.country_code = mc.country_code
LEFT JOIN peaks AS p ON p.mountain_id = mc.mountain_id
LEFT JOIN countries_rivers AS cr ON cr.country_code = c.country_code
LEFT JOIN rivers AS r ON r.id = cr.river_id
GROUP BY c.country_name
ORDER BY highest_peak_elevation DESC, longest_river_length DESC, c.country_name ASC
LIMIT 5;

SELECT c.continent_code, c.currency_code, COUNT(c.currency_code) AS currency_usage
FROM countries AS c
GROUP BY c.continent_code, c.currency_code
ORDER BY currency_usage DESC;
*/
SELECT c.continent_code, c.currency_code, (SELECT MAX(currency_usage1) FROM 
(SELECT c1.continent_code, c1.currency_code, COUNT(c1.currency_code) AS currency_usage1
FROM countries AS c1
WHERE c.continent_code = c1.continent_code
GROUP BY c1.continent_code, c1.currency_code
)
 AS currency_usage11
FROM countries AS c
GROUP BY c.continent_code;