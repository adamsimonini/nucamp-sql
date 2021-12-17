-- divides rows into groups before performing an aggregation on each of the groups
-- returns result set of 1 row per group

-- must come after FROM and WHERE
-- every non-aggregate column in the SELECT list must be in the GROUP BY


-- let's say we want to count the number of records for each book of each of our genres, this is where GROUP BY can help
-- 1) divide group records into groupings based on genre
-- 2) count the number of records contained within each of the groupings (and return 1 number for each group)

SELECT genre, COUNT(*) as book_count
FROM books GROUP BY genre; -- even through GROUP BY comes last, this will work as expected

SELECT customer_id, MIN(order_date) FROM orders 
GROUP BY customer_id 
ORDER BY customer_id;

SELECT customer_id, AVG(freight) as average_freight FROM orders
GROUP BY customer_id
ORDER BY average_freight;

SELECT o.order_id, count(DISTINCT product_id) AS product_count 
FROM order_details o 
GROUP BY order_id HAVING(count(*)) >= 5 
ORDER BY product_count DESC;