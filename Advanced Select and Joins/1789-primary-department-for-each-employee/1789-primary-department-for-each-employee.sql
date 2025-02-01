-- Employees can belong to multiple departments
-- When the employee joins other departments, they need to decide which department is their primary department. 
-- Note that when an employee belongs to only 1 department, their primary column is 'N'.
-- (1) report all the employees with their primary department. 
-- (2) For employees who belong to one department, report their only department.

SELECT employee_id, department_id, primary_flag
FROM Employee
WHERE primary_flag = 'Y' or employee_id IN (
    SELECT employee_id
    FROM Employee
    GROUP BY employee_id
    HAVING COUNT(department_id)=1)

-- | employee_id | department_id | primary_flag |
-- | ----------- | ------------- | ------------ |
-- | 1           | 1             | N            |
-- | 2           | 1             | Y            |
-- | 3           | 3             | N            |
-- | 4           | 3             | Y            |