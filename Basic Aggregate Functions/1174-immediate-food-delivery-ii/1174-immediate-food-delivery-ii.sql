-- delivery date is the same as the order date = immediate
-- otherwise, it is called scheduled.

-- first order = order with the earliest order date that the customer made.
-- semua customer guaranteed punya first order.

-- find the percentage of immediate orders in the first orders of all customers

with cte as (select *, 
row_number() over (partition by customer_id order by order_date) as 'rn',
(case when order_date = customer_pref_delivery_date then 1.0 else 0 end) as 'immediate'
from Delivery)

-- | ----------- | ----------- | ---------- | --------------------------- | -- | --------- |
-- | delivery_id | customer_id | order_date | customer_pref_delivery_date | rn | immediate |
-- | 1           | 1           | 2019-08-01 | 2019-08-02                  | 1  | 0         |
-- | 3           | 1           | 2019-08-11 | 2019-08-12                  | 2  | 0         |
-- | 2           | 2           | 2019-08-02 | 2019-08-02                  | 1  | 1         |
-- | 6           | 2           | 2019-08-11 | 2019-08-13                  | 2  | 0         |
-- | 5           | 3           | 2019-08-21 | 2019-08-22                  | 1  | 0         |
-- | 4           | 3           | 2019-08-24 | 2019-08-24                  | 2  | 1         |
-- | 7           | 4           | 2019-08-09 | 2019-08-09                  | 1  | 1         |

select 
round(SUM(immediate)/COUNT(immediate)*100,2) as immediate_percetage
FROM cte
WHERE rn=1

-- | ----------- | ----------- | ---------- | --------------------------- | -- | --------- |
-- | delivery_id | customer_id | order_date | customer_pref_delivery_date | rn | immediate |
-- | 1           | 1           | 2019-08-01 | 2019-08-02                  | 1  | 0         |
-- | 2           | 2           | 2019-08-02 | 2019-08-02                  | 1  | 1         |
-- | 5           | 3           | 2019-08-21 | 2019-08-22                  | 1  | 0         |
-- | 7           | 4           | 2019-08-09 | 2019-08-09                  | 1  | 1         | 

--                                  JADI 2/4 = 50%