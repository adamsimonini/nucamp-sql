-- in checks a list/array, and only records with a value in the given column that exists within the array are returned

SELECT b.title, b.year FROM books b
WHERE b.year IN (1900, 1986, 1996, 1998); -- so we only want the title and year of books for which the year is found within our provided numbers