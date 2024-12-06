-- Write your MySQL query statement below
SELECT name 
FROM Customer
WHERE COALESCE(referee_id,0) <> 2;
-- coalesce detects nulls and replace it with 0