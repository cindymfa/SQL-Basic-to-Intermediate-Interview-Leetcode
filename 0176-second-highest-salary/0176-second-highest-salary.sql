-- find the second highest distinct salary from the Employee table. 
-- If there is no second highest salary, return null 

select max(salary) as SecondHighestSalary 
from (select 
        salary, 
        dense_rank() over(order by salary desc) as rnk 
    from employee) as iya
where rnk = 2


