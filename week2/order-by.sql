-- orders the records by a column in a certain way, which by default is ascending order
-- if there is a WHERE clause, ORDER BY must come after, which makes perfect sense
-- it should probably be the last statement within the query

SELECT * FROM books ORDER BY year; -- by default this will be ascending order, so the first row will be the lowest year, and the last the highest year

SELECT * FROM books ORDER BY year DESC; -- overriding the default by using DESC, so the order will be reverse from above (highest to lowest)

SELECT * FROM books ORDER BY title; -- when the column's data is TEXT and not INT, the sorting is done alphabetically

SELECT * FROM books ORDER BY genre, author; -- you may add more than one column to order by, as the first ordering can produce ties (e.g., mutliple results have exactly the same genre, or year, or whatever)

-- more complicated example
SELECT company_name FROM customers 
WHERE company_name >= 'Q' ORDER BY company_name DESC;

SELECT e.first_name, e.home_phone FROM employees e
WHERE e.first_name LIKE 'A%' AND home_phone LIKE '%4%'
ORDER BY employee_id;


SELECT title AS book_title, year as book_year 
FROM books
WHERE title LIKE 'B%'
ORDER BY book_year DESC;