CREATE VIEW summary AS
    SELECT s.store_type, 
        ROUND(CAST(SUM(p.sale_price * o.product_quantity) AS NUMERIC), 2) AS total_revenue, 
        ROUND(CAST(SUM(p.sale_price * o.product_quantity) / SUM(SUM(p.sale_price * o.product_quantity)) OVER() * 100 AS NUMERIC), 2) AS percentage_of_revenue, 
        COUNT(o) AS order_count
    FROM dim_store AS s
    JOIN orders AS o ON s.store_code = o.store_code
    JOIN dim_product AS p ON o.product_code = p.product_code
    GROUP BY s.store_type;
