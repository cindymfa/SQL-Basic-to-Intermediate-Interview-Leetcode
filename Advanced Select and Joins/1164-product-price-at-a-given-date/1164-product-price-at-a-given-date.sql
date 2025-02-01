-- find the prices of all products on 2019-08-16
-- Assume the price of all products before any change is 10.

select 
    product_id, 
    new_price as price 
    from Products 
    where (product_id,change_date) in (
        select product_id , max(change_date) as date 
        from Products 
        where change_date <='2019-08-16' 
        group by product_id)

UNION

-- product_id which do not have price change on or before this date. So we find those product_id and set their price as 10 using:
select distinct 
    product_id, 
    10 as price 
    from Products 
    where product_id not in(
        select distinct 
        product_id 
        from Products 
        where change_date <='2019-08-16')