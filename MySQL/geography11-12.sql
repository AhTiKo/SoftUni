USE geography;
/*
SELECT country_name,iso_code FROM countries WHERE LOWER(country_name) LIKE '%a%a%a%' ORDER BY iso_code ASC;

SELECT peaks.peak_name, rivers.river_name, LOWER(CONCAT(SUBSTRING(peaks.peak_name,1,CHAR_LENGTH(peaks.peak_name)-1),rivers.river_name)) AS mix FROM peaks,rivers WHERE SUBSTRING(peaks.peak_name,CHAR_LENGTH(peaks.peak_name),1) LIKE SUBSTRING(rivers.river_name,1,1) ORDER BY mix ASC;

SELECT peak_name, river_name,
LOWER(CONCAT(peak_name,LOWER(SUBSTRING(river_name,2)))) AS 'mix'
FROM peaks AS p, rivers AS r
WHERE RIGHT(p.peak_name,1) = LEFT(r.river_name,1)
ORDER BY mix;
*/
