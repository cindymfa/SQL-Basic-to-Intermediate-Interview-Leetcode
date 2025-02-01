-- average experience years of all the employees for each project, rounded to 2 digits.
select a.project_id, round(avg(b.experience_years),2) as average_years
from Project a
LEFT JOIN Employee b
ON a.employee_id = b.employee_id
GROUP BY 1