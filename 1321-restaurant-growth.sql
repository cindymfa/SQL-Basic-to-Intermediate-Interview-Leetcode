-- Compute the moving average of how much the customer paid in 7 days window 
-- (current day + 6 days before)
-- https://leetcode.com/problems/restaurant-growth/?envType=study-plan-v2&envId=top-sql-50 


SELECT DISTINCT
    visited_on,
    SUM(amount) OVER(ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) AS amount,
    ROUND(SUM(amount) OVER(ORDER BY visited_on RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW) / 7, 2) AS average_amount
FROM
    Customer
LIMIT 1000000
OFFSET 6