-- when you want to search for a string pattern, and not a specific string
-- also known as "fuzzy matching"
-- evalutes as TRUE if the string is contained within the possible set of strings represented by the given pattern

-- % means matches any sequence of zero or more characters
-- _ means matches any single character


-- "Big Fish" LIKE "Big%" is TRUE because the % sign is very accomidating
-- "Big Fish" LIKE "Big_Fish_" is FALSE because Fish_ expect there to be a character, any character, after the "h" 

SELECT b.title as T_books
FROM books b
Where b.title LIKE 'T%'; -- only books where the title starts with "T"

SELECT b.title as contains_T
FROM books b
Where b.title LIKE '%T%'; -- any and all books containing "T" within their titles

SELECT b.title as contains_t
FROM books b
Where b.title ILIKE '%T%'; -- any and all books containing "T" or "t" within their titles, as ILIKE is case-insensitive

-- more complex example
SELECT e.first_name, e.home_phone FROM employees e
WHERE e.first_name LIKE 'A%' AND home_phone LIKE '%4%'
ORDER BY employee_id;