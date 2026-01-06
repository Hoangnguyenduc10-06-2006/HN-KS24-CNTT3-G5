USE ecommerce_subquery;

SELECT c.id,c.name,c.email
FROM customers c
WHERE id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING SUM(total_amount) = (
        SELECT MAX(total_sum)
        FROM (
            SELECT SUM(total_amount) AS total_sum
            FROM orders
            GROUP BY customer_id
        ) AS t
    )
);
