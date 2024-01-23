SELECT p.category
FROM dim_product AS p
JOIN orders AS o ON p.product_code = o.product_code
JOIN dim_store AS s ON o.store_code = s.store_code
JOIN dim_date AS d ON o.order_date = d.date
WHERE s.full_region = 'Wiltshire, UK' AND
    d.year = 2021
GROUP BY p.category
ORDER BY SUM((p.sale_price - p.cost_price) * o.product_quantity) DESC
LIMIT 1;