-- INTERSECT is like a venn diagram with records from two tables

-- it only returns the duplicates (i.e., valid records from both tables) and eliminates all unique rows

SELECT title, author, year FROM amazon_best_sellers
INTERSECT
SELECT title,  president AS author, year FROM president_books;
