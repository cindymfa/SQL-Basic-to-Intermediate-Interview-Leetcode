-- IDs of the employees whose salary less than $30000 and whose manager left the company. 
-- name = null --> When a manager leaves the company
-- Return the result table ordered by employee_id.

select employee_id
from Employees
where salary < 30000 and manager_id not in (
    select employee_id
    from Employees)
order by employee_id