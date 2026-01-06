create database b5;
use b5;

CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO customers (id, name, email) VALUES
(1, 'Nguyễn Văn A', 'a@gmail.com'),
(2, 'Trần Thị B', 'b@gmail.com'),
(3, 'Lê Văn C', 'c@gmail.com'),
(4, 'Phạm Thị D', 'd@gmail.com'),
(5, 'Hoàng Văn E', 'e@gmail.com');

INSERT INTO orders (id, customer_id, order_date, total_amount) VALUES
(1, 1, '2025-01-01', 150000),
(2, 1, '2025-01-03', 250000),
(3, 2, '2025-01-04', 300000),
(4, 2, '2025-01-06', 200000),
(5, 3, '2025-01-07', 500000),
(6, 3, '2025-01-08', 400000),
(7, 4, '2025-01-09', 120000),
(8, 5, '2025-01-10', 800000);

SELECT *
FROM customers
WHERE id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING SUM(total_amount) = (
        SELECT MAX(total_customer_total)
        FROM (
            SELECT SUM(total_amount) AS total_customer_total
            FROM orders
            GROUP BY customer_id
        ) AS temp
    )
);
