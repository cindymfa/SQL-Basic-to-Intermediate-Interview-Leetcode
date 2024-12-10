-- find the person_name of the last person that can fit on the bus without exceeding the weight limit
-- the bus has a weight limit of 1000 kilograms
SELECT person_name 
FROM (
    SELECT person_name,
    turn,
    sum(weight) over (order by turn) AS cum 
    FROM queue) iya
WHERE cum<=1000
ORDER BY cum DESC 
LIMIT 1

-- | person_name | turn | cum  |
-- | ----------- | ---- | ---- |
-- | Alice       | 1    | 250  |
-- | Alex        | 2    | 600  |
-- | John Cena   | 3    | 1000 |
-- | Marie       | 4    | 1200 |
-- | Bob         | 5    | 1375 |
-- | Winston     | 6    | 1875 |