-- manager = employee who has at least 1 other employee reporting to them.
-- 1. report the ids and the names of all managers,
-- 2. the number of employees who report directly to them,
-- 3. and the average age of the reports rounded to the nearest integer.

select 
    mgr.employee_id, 
    mgr.name, 
    count(emp.reports_to) as reports_count,
    round(avg(emp.age)) as average_age
from Employees emp 
join Employees mgr
on emp.reports_to = mgr.employee_id
group by mgr.employee_id
order by emp.employee_id



-- -------------------------------------------  -----------------------------------------
-- | employee_id | name  | reports_to | age |   employee_id | name  | reports_to | age |
-- | ----------- | ----- | ---------- | --- |   ----------- | ----- | ---------- | --- |
-- | 9           | Hercy | null       | 43  |   4           | Bob   | 9          | 36  |
-- | 9           | Hercy | null       | 43  |   6           | Alice | 9          | 41  |
-- ------------ mgr.employee_id ---------- \\\  ----------- emp.reports_to -------------
