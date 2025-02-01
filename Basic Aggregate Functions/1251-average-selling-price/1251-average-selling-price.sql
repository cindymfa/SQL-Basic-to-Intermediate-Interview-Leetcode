select a.product_id, round( (sum(b.units * a.price) / sum(units)), 2) as average_price
from Prices a 
left join UnitsSold b
on a.product_id = b.product_id
where b.purchase_date between start_date and end_date
group by 1