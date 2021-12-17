--- LEFT JOIN is a for each on the main table (i.e. FROM table-name)
-- when there is no appropriate data from the table joining into the left table, the NULL placeholder is used
-- all records from first table will be included in result, regardless of matching with second table

SELECT c.name, o.dollar_amount_spent
FROM customers c
LEFT JOIN orders o
ON o.customer_id = c.id

--- RIGHT JOIN is a for each on the main table (i.e. RIGHT JOIN table-name)
-- when there is no appropriate data from the table joining into the right table, the NULL placeholder is used
-- all records from second table will be included in result, regardless of matching with first table
SELECT c.name, o.dollar_amount_spent
FROM customers c
RIGHT JOIN orders o
ON o.customer_id = c.id

--- FULL JOIN is very accepting, and will often produce a bigger result
-- the unmatched columns of each record will be populated with null placeholders as needed
-- FULL JOIN simply combines the results from LEFT JOIN & RIGHT JOIN
SELECT c.name, o.dollar_amount_spent
FROM customers c
FULL JOIN orders o
ON o.customer_id = c.id

SELECT product_name, category_name FROM products p
JOIN categories c ON p.category_id = c.category_id

SELECT o.order_id, s.company_name FROM orders o
INNER JOIN shippers s ON o.ship_via = s.shipper_id;

-- A three-table sequential double-join, featuring a SUM() aggregration
-- For each customer order, list the company_name, order_id, and total quantity of products ordered.
SELECT o.order_id, c.company_name, SUM(od.quantity) FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
INNER JOIN order_details od ON o.order_id = od.order_id
GROUP BY o.order_id, c.company_name;