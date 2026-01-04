
SELECT *
FROM orders
WHERE status = 'completed';

SELECT *
FROM orders
WHERE total_amount > 5000000;

SELECT *
FROM orders
ORDER BY order_date DESC
LIMIT 5;

SELECT *
FROM orders
WHERE status = 'completed'
ORDER BY total_amount DESC;
