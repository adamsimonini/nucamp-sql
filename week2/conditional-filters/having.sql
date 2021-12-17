-- HAVING filteres aggregated rows

-- here, we use it to only allow for aggregate rows where the grouping has more than one record
SELECT genre, COUNT(*) AS book_count
FROM books
GROUP BY genre
HAVING COUNT(*) > 1;

SELECT genre, COUNT(*) as num_of_genres FROM books
GROUP BY genre
HAVING COUNT(*) > 1;