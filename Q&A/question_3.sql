SELECT s.store_type 
FROM dim_store AS s
JOIN orders AS o ON s.store_code = o.store_code
JOIN dim_date AS d ON o.order_date = d.date
JOIN dim_product AS p ON o.product_code = p.product_code
WHERE d.year = 2022 AND
    s.country = 'Germany'
GROUP BY s.store_type
ORDER BY SUM(p.sale_price * o.product_quantity) DESC
LIMIT 1;