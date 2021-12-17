-- EXCEPT returns all records from table 1 not present in table 2
-- basically, it filters out all matching records between the two tables and returns only the unique ones for a given table

SELECT title, author, year FROM amazon_best_sellers
EXCEPT
SELECT title,  president AS author, year FROM president_books;