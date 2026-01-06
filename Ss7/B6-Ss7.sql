create database b6;
use b6;

CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO orders (id, customer_id, order_date, total_amount) VALUES
(1, 1, '2025-01-01', 150000),
(2, 1, '2025-01-03', 250000),
(3, 2, '2025-01-04', 300000),
(4, 2, '2025-01-06', 200000),
(5, 3, '2025-01-07', 500000),
(6, 4, '2025-01-08', 120000),
(7, 5, '2025-01-09', 800000);

SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > (
    SELECT AVG(total_customer_total)
    FROM (
        SELECT SUM(total_amount) AS total_customer_total
        FROM orders
        GROUP BY customer_id
    ) AS temp
);
