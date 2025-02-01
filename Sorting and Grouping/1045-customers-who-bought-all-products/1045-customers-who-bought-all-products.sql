--  report the customer ids from the Customer table
-- that bought all the products in the Product table.
select customer_id 
from customer 
GROUP BY customer_id
HAVING count(distinct product_key) = (select count(*) from Product)