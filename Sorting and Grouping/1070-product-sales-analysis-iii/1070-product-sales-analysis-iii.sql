-- select the product id, year, quantity, and price for the first year of every product sold.
SELECT product_id, year AS first_year, quantity, price
FROM Sales
WHERE (product_id, year) in (
    SELECT product_id, MIN(year) 
    FROM Sales
    GROUP BY product_id)
-- min year gabisa masuk ke select
-- karena kolom lain (quantity&price) gak pake agregat (perhitungan)