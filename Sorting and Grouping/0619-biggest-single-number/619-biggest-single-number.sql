-- single number = number that appeared only once in the MyNumbers table.
-- Find the largest single number. If there is no single number, report null

-- select max(num) as num
## ini ngitung max per group num, jadi max grup 8 ya 8, grup 3 ya 3
-- from MyNumbers 
-- group by num - 8 ada 2(8,8)-> max 8)
-- having count(num)=1

-- subquery di form
SELECT MAX(num) as num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
    ) AS singlenumbers

-- pake subquery where + in
SELECT MAX(num) AS num
FROM MyNumbers
WHERE num IN (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
    );