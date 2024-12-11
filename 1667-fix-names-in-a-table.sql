-- fix the names so that only the first character is uppercase and the rest are lowercase.
SELECT 
    user_id, 
    CONCAT(UPPER(LEFT(name,1)),
           LOWER(RIGHT(name,LENGTH(name)-1))) as name
FROM Users
ORDER BY user_id