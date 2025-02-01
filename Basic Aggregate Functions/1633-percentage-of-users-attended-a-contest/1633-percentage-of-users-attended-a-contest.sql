-- percentage of the users registered in each contest rounded to two decimals.
-- Return the result table ordered by percentage in descending order.
-- contest_id in ascending order.
select r.contest_id, 
ROUND((COUNT(DISTINCT r.user_id)) / (SELECT COUNT(*) FROM Users) * 100, 2) as percentage
FROM Users u
RIGHT JOIN Register r
ON u.user_id=r.user_id
GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id;