create database b4;
use b4;

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
(2, 1, '2025-01-03', 200000),
(3, 2, '2025-01-04', 300000),
(4, 3, '2025-01-05', 120000),
(5, 3, '2025-01-06', 180000),
(6, 3, '2025-01-07', 220000),
(7, 5, '2025-01-08', 500000);

SELECT
    name,
    (
        SELECT COUNT(*)
        FROM orders
        WHERE orders.customer_id = customers.id
    ) AS order_count
FROM customers;
