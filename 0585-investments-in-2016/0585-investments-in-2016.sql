-- have the same tiv_2015 value as one or more other policyholder
-- not located in the same city as any other policyholder 
-- (i.e., the (lat, lon) attribute pairs must be unique).
select 
    sum(tiv_2016) as tiv_2016 
from Insurance
where (lat,lon) in (select 
                        lat, lon 
                        from Insurance 
                        group by lat 
                        having count(*) = 1)
group by tiv_2015
having count(*) > 1