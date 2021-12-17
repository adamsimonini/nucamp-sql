-- JOINS utilize foreign keys in tables to pull in data from multiple tables into a query's response
-- INNER (default), LEFT, FULL

-- ONE-TO-ONE
-- compares left_column to right_column, and if thy are equal, the selected record is added to rhe result set
SELECT cc.name AS capital_ciy_name, c.name AS country_name
FROM capital_cities cc
INNER JOIN countries c ON cc.country_id = c.id

-- MANY-TO-ONE
-- country_id is a foreign key of the country's table primary key (its id)
SELECT c.name, o.dollar_amount_spent
FROM customers c
INNER JOIN orders o ON o.customer_id = c.id

-- MANY-TO-MANY
-- this is complex because there is a junction table
SELECT a.name AS author, b.name AS book
FROM authors a
INNER JOIN books_authors ba ON a.id = ba.author_id
INNER JOIN books b ON b.id = ba.book_id