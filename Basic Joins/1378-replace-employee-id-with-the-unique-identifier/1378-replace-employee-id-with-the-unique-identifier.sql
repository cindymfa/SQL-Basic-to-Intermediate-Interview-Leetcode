-- Write a solution to show the unique ID of each user
-- If a user does not have a unique ID replace just show null.
SELECT u.unique_id, e.name
FROM EmployeeUNI u
RIGHT JOIN Employees e
ON u.id = e.id;