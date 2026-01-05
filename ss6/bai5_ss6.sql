USE ecommerce_demo;

SELECT 
    c.customer_id,
    c.full_name,
    COUNT(o.order_id)    AS total_orders,
    SUM(o.total_amount) AS total_spent,
    AVG(o.total_amount) AS avg_order_value
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name
HAVING COUNT(o.order_id) >= 3
   AND SUM(o.total_amount) > 10000000
ORDER BY total_spent DESC;

-- Doanh thu từng sản phẩm
SELECT 
    p.product_id,
    p.product_name,
    SUM(oi.quantity * p.price) AS revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY revenue DESC;