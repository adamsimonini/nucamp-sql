-- UNION = the set of all elements within a collection 

-- UNION operator is used to combine the result sets from two SELECT queries
-- it removes duplicates

-- constraints: must have same number of columns, same order of columns, and the data types must be compatible across the columns

SELECT title, president AS author, year FROM president_books
UNION
SELECT title, president, year FROM amazon_best_sellers;

-- UNION ALL is inclusive of duplicates
SELECT title, president AS author, year FROM president_books
UNION ALL
SELECT title, president, year FROM amazon_best_sellers;
