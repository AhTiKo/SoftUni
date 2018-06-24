USE book_library;
/*
SELECT title FROM books WHERE SUBSTRING(title,1,3) = 'The' ORDER BY id;

UPDATE books SET title = REPLACE(title,'The','***') WHERE SUBSTRING(title,1,3)='The';
SELECT title FROM books WHERE SUBSTRING(title,1,3) = '***' ORDER BY id;

SELECT title FROM books WHERE title LIKE '***%';

SELECT CONCAT(first_name,' ',last_name) AS 'Full Name', TIMESTAMPDIFF(day,born,died) FROM authors;

SELECT ROUND(SUM(cost),2) FROM books;

SELECT CONCAT(first_name,' ',last_name) AS 'Full Name', if(TIMESTAMPDIFF(day,born,died) is NULL,TIMESTAMPDIFF(day,born,NOW()),TIMESTAMPDIFF(day,born,died)) AS 'Days Lived' FROM authors;

SELECT title FROM books WHERE title LIKE 'Harry Potter%' ORDER BY id; 
*/
