-- temporary result sets are called common table expressions (CTEs)


-- we're creating a temporary table, in order to leverage it within the SELECT statement that follows
-- 
WITH top_regions AS ( -- this is our temporary table: top_regions
    SELECT region
    FROM regional_sales
    WHERE total_sales > 999
)
SELECT region, product, SUM(quantity) AS product_units, SUM(amount) AS product_sales
FROM orders
WHERE region IN (SELECT region FROM top_regions)
Group BY region, product;

-- for all records in both the professors and students tables, return the records that appear more than once
WITH all_names AS (
    SELECT last_name FROM professors
    UNION ALL
    SELECT last_name FROM students
)
SELECT last_name, COUNT(*)
FROM all_names
GROUP BY last_name
HAVING COUNT(*) > 1;


WITH people AS (
    -- you can manaully, explicitly add a column with a fixed value to each record using a string and the AS keyword
    SELECT 'professor' AS occupation, first_name, last_name, department_id FROM professors
    UNION ALL
    SELECT 'student' AS occupation, first_name, last_name, major_department_id FROM students;
)
SELECT occupation, first_name, last_name, d.code
FROM people
JOIN departments d
ON department_id = d.id;