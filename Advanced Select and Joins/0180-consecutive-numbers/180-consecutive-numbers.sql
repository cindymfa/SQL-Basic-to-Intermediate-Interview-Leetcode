-- Find all numbers that appear at least three times consecutively
SELECT distinct num as ConsecutiveNums
FROM(
    SELECT id, 
    num,
    lag(num) over(order by id) as prev_num,
    lead(num) over (order by id) as next_num
    FROM logs
    ) as sq
WHERE sq.num=sq.prev_num AND sq.num=sq.next_num

--                lag        lead
-- | id | num | prev_num | next_num |
-- | -- | --- | -------- | -------- |
-- | 1  | 1   | null     | 1        |
-- | 2  | 1   | 1        | 1        | --> memenuhi kriteria where num = prev = next
-- | 3  | 1   | 1        | 2        |
-- | 4  | 2   | 1        | 1        |
-- | 5  | 1   | 2        | 2        |
-- | 6  | 2   | 1        | 2        |
-- | 7  | 2   | 2        | null     |