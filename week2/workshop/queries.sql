-- Part 1: Filters

-- 1.1
-- Select all columns from the categories table.
-- Use an ORDER BY clause to sort the results by category_id.

SELECT * FROM categories
ORDER BY category_id;

-- 1.2
-- Select each city from the employees table without any duplicates
-- and sort in descending order.

SELECT DISTINCT city FROM employees
ORDER BY city DESC;

-- 1.3
-- Select product_id and product_name of all discontinued products
-- and sort by product_id.
--
-- Hint: only include products for which the discontinued column is true.

SELECT product_id, product_name FROM products
WHERE discontinued = true;

-- 1.4
-- Select the first_name and last_name of employees who do not have anyone to report to
-- (i.e. their reports_to field is blank).
-- Sort by employee_id.

SELECT first_name, last_name FROM employees
WHERE reports_to IS NULL
ORDER BY employee_id;

-- 1.5
-- Select the product_name of each product where the units_in_stock is less than
-- or equal to the reorder_level.
-- You only need the products that are not discontinued and only include
-- products that have more than 0 units_on_order.
-- Sort the results by product_id.
--
-- Hint: start simple, do the select without any restrictions and confirm you're
-- getting the data you expect. Then add each of the restrictions one by one.

SELECT p.product_name FROM products p
WHERE p.units_in_stock <= p.reorder_level 
    AND p.discontinued IS NOT NULL 
    AND p.units_on_order > 0;

-- Part 2: Functions, Grouping
-- Here are some real queries you might be asked on a day-to-day basis.
-- Sometimes SQL is the fastest and most elegant way to get this data.

-- 2.1
-- How many orders have been made?

SELECT COUNT(*) AS num_of_orders, FROM orders;

-- 2.2
-- How many orders has each customer made?
-- For each customer, select customer_id and the count of their orders.
-- Sort first by the order-count (greatest to least), then customer_id (alphabetically)

SELECT customer_id, COUNT(*) AS order_count FROM orders
GROUP BY customer_id
ORDER BY order_count DESC, customer_id;

-- 2.3
-- Where are we shipping a lot of orders to?
-- Select the ship_address and the count of orders for the ship_address that
-- has received the most orders.
--
-- Note: consider how we might extend this query, applying it to each customer. 
-- Combined with a location-based mapping service, you could easily see where you're selling a lot of products,
-- and where you might want to focus more advertising - a great data science application!
-- We will take a closer look at data science and data visualizations in a future lesson.

SELECT MAX(ship_address) AS most_shipped_to_address FROM orders;

-- 2.4
-- Who could we offer our new freight discount campaign to?
-- For each customer, select customer_id and the total amount spent on freight
-- across all of their orders. Only include those who have spent more than $500.
-- Sort by customer_id.

SELECT customer_id, SUM(freight) AS freight_expenditure FROM orders
WHERE freight > 499
GROUP BY customer_id
ORDER BY customer_id;

-- 2.5
-- We want to offer white glove shipping to our best customers.
-- But first, do we need to consolidate the shippers we use? How many different
-- shippers do our customers normally deal with?
-- For each customer, count how many different shippers have ever sent them an order.
-- Then, select the average of those counts.
--
-- Hint: ship_via is a foreign key column in orders that references shippers.

SELECT ship_via FROM orders;

SELECT
    AVG(num_of_shippers) AS average_ship_num
FROM 
    (
        SELECT COUNT(DISTINCT ship_via) AS num_of_shippers
        FROM orders
    )
    AS num_ship

-- Part 3: Mix and Match

-- 3.1
-- Let's review our product categories.
-- List each product_name and its corresponding category_name.
-- Do not include products that have a null category_id
-- Sort by product_id.
--
-- Hint: check which join type you should use in this situation.

SELECT p.product_name, p.category_name
FROM products p
INNER JOIN categories c ON p.category_id = c.category_id

-- 3.2
-- HR wants to do a staff audit across the regions.
-- List region_description, territory_description, employee last_name,
-- and employee first_name for each territory and region an employee works in.
--
-- To make it easier for them, remove duplicate results and also sort first by
-- region_description, then territory_description, then last_name, and finally first_name.
--
-- Hint: joins can only take two tables at a time, but you use multiple joins in
-- one query by listing each after the other.
-- Try an inner join on employees -> employees_territories -> territories -> region

SELECT r.region_description, ter.territory_description, e.last_name, e.first_name FROM employees e
INNER JOIN employees_territories er ON e.employee_id = er.employee_id
INNER JOIN territories ter ON er.territory_id = ter.territory_id
INNER JOIN region r ON ter.region_id = r.region_id
ORDER BY r.region_description, ter.territory_description, e.last_name, e.first_name;

-- 3.3
-- Finance wants to audit the sales tax rates we've applied and needs a list of
-- each customer in the different states.
-- List state_name, state_abbr, and company_name for all customers in the U.S.
-- If a state has no customers, still include it in the result with a NULL
-- placeholder for the company_name.
-- Sort by state_name.
--
-- Hint: match the customer's region on the state's abbreviation.

SELECT s.state_name, s.state_abbr, c.company_name FROM customers c
RIGHT JOIN us_states s ON c.region = s.state_abbr
WHERE c.country = 'USA'
ORDER BY state_name;

-- 3.4
-- The Talent Acquisition team is looking to fill some open positions.
-- Select the territory_description and region_description for territories
-- that do not have any employees.
-- Sort by territory_id.

-- *** this week's workshop is extremely difficult. I'm not sure how to do it... ***
SELECT t.territory_description, r.region_description FROM territories t
INNER JOIN employees_territories et ON t.territory_id = et.territory_id
INNER JOIN region r ON r.region_id = t.region_id
ORDER BY t.territory_id
-- WHERE t.territory_id NOT IN (SELECT territory_id from employees_territories)
-- WHERE NOT EXISTS (SELECT et.territory_id FROM et.territory_id WHERE t.territory_id = et.territory_id)

-- 3.5
-- Management needs a list of all suppliers' and customers' contact information 
-- for the holiday greeting cards!
-- Select company_name, address, city, region, postal_code, and country 
-- for all suppliers and all customers.
-- Sort by company_name.

SELECT company_name, address, city, region, postal_code, country FROM suppliers
UNION ALL
SELECT company_name, address, city, region, postal_code, country FROM customers
ORDER BY company_name

-- 3.6
-- And of course, our famous holiday gift baskets go out to our best customers.
-- Get customer company_name and the total quantity of products ever ordered by
-- said customer. Only select those that have ordered a total quantity of at
-- least 500.
-- Sort by total quantity in descending order.

WITH quantity_orders AS (
	SELECT o.customer_id, od.quantity FROM orders o
	lEFT JOIN order_details od ON o.order_id = od.order_id
)
SELECT customer_id, SUM(quantity) AS order_quantity FROM quantity_orders
GROUP BY customer_id
HAVING(SUM(quantity) > 499)
ORDER BY order_quantity DESC

-- SELECT p.product_name, p.category_name
-- FROM products p
-- INNER JOIN categories c ON p.category_id = c.category_id

-- SELECT od.order_id, od.quantity 
-- FROM order_details od
-- INNER JOIN orders o ON od.order_id = o.customer_id;

-- SELECT od.quantity, o.customer_id
-- FROM order_details od
-- INNER JOIN orders o ON od.order_id = o.order_id

-- WITH temporaryTable (sum_order_quantity, customer_id) AS 
-- (
--     SELECT SUM(order_details.quantity) AS order_quantity, orders.customer_id FROM order_details
--     INNER JOIN orders ON order_details.order_id=orders.order_id
-- )

-- SELECT SUM(order_details.quantity) AS order_quantity, orders.customer_id FROM order_details
-- INNER JOIN orders ON order_details.order_id=orders.order_id
-- WHERE order_quantity > 499
-- GROUP BY orders.customer_id;

-- WITH temporaryTable (averageValue) as
--     (SELECT avg(Attr1)
--     FROM Table)
--     SELECT Attr1
--     FROM Table, temporaryTable
--     WHERE Table.Attr1 > temporaryTable.averageValue;

-- select sum(order_details.quantity) AS abc ,orders.customer_id from order_details
-- inner join orders on order_details.order_id=orders.order_id
-- where abc > 500
-- group by orders.customer_id

-- SELECT product_name, 