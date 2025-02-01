-- Write your MySQL query statement below
SELECT name
FROM Employee
WHERE id IN (
    SELECT managerID FROM Employee
    GROUP BY managerID
    HAVING Count(managerID) >=5
);

-- atau
SELECT e2.name
from Employee e1
INNER JOIN Employee e2
ON e1.managerId = e2.id
GROUP BY e1.managerId
HAVING COUNT(e1.id) >= 5

---------------- e1 manager ------------- \\\-------------- e2.id --------------
-- | id  | name  | department | managerId | id  | name | department | managerId |
-- | --- | ----- | ---------- | --------- | --- | ---- | ---------- | --------- |
-- | 106 | Ron   | B          | 101       | 101 | John | A          | null      |
-- | 105 | Anne  | A          | 101       | 101 | John | A          | null      |
-- | 104 | Amy   | A          | 101       | 101 | John | A          | null      |
-- | 103 | James | A          | 101       | 101 | John | A          | null      |
-- | 102 | Dan   | A          | 101       | 101 | John | A          | null      |
