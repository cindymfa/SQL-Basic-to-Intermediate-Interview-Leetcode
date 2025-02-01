# Write your MySQL query statement below
select r.contest_id, ROUND((COUNT(DISTINCT r.user_id)) / (SELECT COUNT(user_id) FROM Users) * 100, 2) as percentage
FROM USERS u
RIGHT JOIN Register r
ON u.user_id=r.user_id
GROUP BY r.contest_id
ORDER BY percentage DESC, r.contest_id;