-- report the movies with an odd-numbered ID and a description that is not "boring"
SELECT id, movie, description, rating
FROM Cinema
WHERE (id % 2 = 1) AND description NOT IN ("boring")
ORDER BY rating DESC;