-- Note that each session belongs to exactly one user.
-- find the daily active user count for a period of 30 days ending 2019-07-27 inclusively
-- active = at least one activity on that day.

SELECT 
activity_date as day,
count(distinct user_id) as active_users
FROM Activity
WHERE datediff('2019-07-27',activity_date)<30 AND activity_date <= '2019-07-27'
GROUP BY activity_date

-- SELECT DATE_SUB("2019-07-27", INTERVAL 30 DAY);
--> tanggal terkecil selama 30 hari 2019-06-27
-- jadi data user 4 gaikut dihitung