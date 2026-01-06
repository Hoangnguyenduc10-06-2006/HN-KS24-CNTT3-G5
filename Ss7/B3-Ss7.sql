create database b3;
use b3;

CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO orders (id, customer_id, order_date, total_amount) VALUES
(1, 1, '2025-01-01', 150000),
(2, 2, '2025-01-02', 300000),
(3, 3, '2025-01-03', 450000),
(4, 1, '2025-01-04', 200000),
(5, 4, '2025-01-05', 600000);

SELECT *
FROM orders
WHERE total_amount > (
    SELECT AVG(total_amount)
    FROM orders
);
