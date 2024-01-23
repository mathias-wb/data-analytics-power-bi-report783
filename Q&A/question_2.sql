SELECT d.month_name
FROM dim_date AS d
JOIN orders AS o ON d.date = o.order_date
JOIN dim_product AS p ON o.product_code = p.product_code
WHERE d.year = 2022
GROUP BY d.month_name
ORDER BY SUM(p.sale_price * o.product_quantity) DESC
LIMIT 1;