# Write your MySQL query statement below
SELECT distinct num as ConsecutiveNums
FROM(SELECT id, num,
lag(num) over(order by id) as prev_num,
lead(num) over (order by id) as next_num
FROM logs) as sq
WHERE sq.num=sq.prev_num AND sq.num=sq.next_num