-- COUNT, MAX, MIN, AVG, SUM

-- with aggregate functions, we can get our database to produce a new column that aggregates some data, like the MIN number in a column, or simply the number of records within a column

-- this will count any and all books (due to wildcard) and place the number in a new column called "book_count"
SELECT COUNT(*)
AS book_count
FROM books;

-- this find the smallest number, and place it in a new column called "year_of_oldest_book"
SELECT MIN(b.year)
AS year_of_oldest_book
FROM books b;

-- this will tell us how many genres are contained within our records 
SELECT COUNT(DISTINCT genre)
as genre_count
FROM books;


SELECT COUNT(*) as num_of_books FROM books;

SELECT MAX(year) as latest_book_year FROM books;

SELECT customer_id, AVG(freight) as average_freight FROM orders
GROUP BY customer_id
ORDER BY average_freight;

SELECT o.order_id, COUNT(DISTINCT product_id) AS product_count 
FROM order_details o 
GROUP BY order_id HAVING(COUNT(*)) >= 5 
ORDER BY product_count DESC;

-- return customer_id and fabricated order_count for each record, but group them by customer_id first, and then order them by count (highest to lowest) and then alphabetically (implicitly)
SELECT customer_id, COUNT(*) as order_count FROM orders
GROUP BY customer_id
ORDER BY order_count DESC, customer_id;

-- give me shipping address most frequently used from the orders table, and we'll do this by aggregating the ship_address column using MAX()
SELECT MAX(ship_address) AS most_shipped_to_address FROM orders;