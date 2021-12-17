-- EXISTS, ANY, ALL, IN, NOT IN (all are logical operators)

-- Use between WHERE clause and subquery
-- SELECT * FROM table WHERE EXISTS (nested query)

-- EXISTS returns boolean value on the subquery

SELECT
    AVG(num_of_shippers) AS average_ship_num
FROM 
    (
        SELECT COUNT(DISTINCT ship_via) AS num_of_shippers
        FROM orders
    )
    AS num_ship

WITH shippers_per_customers AS (
    SELECT COUNT(DISTINCT ship_via)
    FROM orders
    GROUP BY customer_id
) SELECT AVG(count) FROM shippers_per_customers;