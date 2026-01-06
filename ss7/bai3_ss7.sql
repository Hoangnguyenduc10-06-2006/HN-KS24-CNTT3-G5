USE ecommerce_subquery;

SELECT o.id,o.customer_id,o.order_date,o.total_amount
FROM orders o
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM orders
);
