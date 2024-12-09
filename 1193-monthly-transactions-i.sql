-- each year&month and country, 
-- the number of transactions
-- and their total amount, 
-- the number of approved transactions and
-- their total amount

SELECT date_format(trans_date, '%Y-%m') AS month,
country,
COUNT(*) as trans_count,
SUM(CASE WHEN state='approved'THEN 1 ELSE 0 END) as approved_count,
SUM(amount) as trans_total_amount,
SUM(CASE WHEN state='approved' THEN amount ELSE 0 END) as approved_total_amount 
FROM Transactions
GROUP BY month, country