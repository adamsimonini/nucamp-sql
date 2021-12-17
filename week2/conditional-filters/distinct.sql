SELECT DISTINCT genre from books;
-- this means we will only get as many results back as there are unique values for genre within the table's records

SELECT DISTINCT genre from books LIMIT 1;
-- for any query, limit will cap the result set at the provided number of records (not all versions of SQL support this keyword)

SELECT o.order_id, count(DISTINCT product_id) AS product_count 
FROM order_details o 
GROUP BY order_id HAVING(count(*)) >= 5 
ORDER BY product_count DESC;