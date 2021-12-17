SELECT authors, title FROM books;

-- you can use aliases for both columns, and tables

-- column alias syntax
SELECT author as book_author, title as book_title FROM books; -- our response now referse to the columns with the alias names instead of the names within the table

-- table alias syntax
SELECT b.author as book_author, b.title as book_title from books b; -- this makes long queries more readable (imagine grabbing columns from multiple tables), and can even speed them up 

SELECT * from books; -- this is a wildcard, which returns data for all columns within the table

-- more complicated query combining multiple clauses
SELECT title AS book_title, year as book_year 
FROM books
WHERE title LIKE 'B%'
ORDER BY book_year DESC;