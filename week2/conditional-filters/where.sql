SELECT title, author FROM books WHERE genre = 'Novel';

-- logical operators (e.g., AND, OR) maybe be used to extend the filtering
SELECT title, author 
FROM books 
WHERE genre = 'Novel' AND year < 1900;

