-- report the name and bonus amount 
-- of each employee with a bonus less than 1000
SELECT e.name, b.bonus
FROM Employee e
LEFT JOIN Bonus b
ON e.empId = b.empId
WHERE b.bonus < 1000 or b.bonus IS NULL;