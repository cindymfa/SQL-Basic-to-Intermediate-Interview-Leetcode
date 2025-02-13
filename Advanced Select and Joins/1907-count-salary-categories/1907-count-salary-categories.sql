--  calculate the number of bank accounts for each salary category
-- low < 20,000 
-- average 20,000 - 50,000
-- high 50,000

SELECT 'Low Salary' AS category, 
    COUNT(if(income<20000,1,null)) AS accounts_count
FROM Accounts
UNION
SELECT 'Average Salary', 
    COUNT(if(income>=20000 and income<=50000,1,null))
FROM Accounts
UNION
SELECT 'High Salary', 
    COUNT(if(income>50000,1,null))
FROM Accounts;