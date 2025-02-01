-- names of products >=100 units ordered in February 2020 and their amount.
SELECT p.product_name, sum(o.unit) unit
FROM Products p
JOIN Orders o
ON p.product_id = o.product_id
WHERE DATE_FORMAT(o.order_date,'%Y-%m') ='2020-02'
GROUP BY o.product_id
HAVING unit >= 100