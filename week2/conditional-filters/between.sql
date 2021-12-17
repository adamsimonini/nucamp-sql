-- the bounds of BETWEEN are inclusive
-- evalutes as TRUE of the column's value is between the upper and lower bounds

SELECT b.title as twentieth_century_books -- here the alias makes a lot of sense, as we'll be filtering the titles for only books within this time period
FROM books b
WHERE b.year BETWEEN 1900 AND 1999;

-- further example
SELECT c.company_name FROM customers c
WHERE c.company_name BETWEEN 'Q%' AND 'Z%';
