CREATE DATABASE IF NOT EXISTS ecommerce_subquery;
USE ecommerce_subquery;

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

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
(1, 'Nguyen Van A', 'a@gmail.com'),
(2, 'Tran Thi B', 'b@gmail.com'),
(3, 'Le Van C', 'c@gmail.com'),
(4, 'Pham Thi D', 'd@gmail.com'),
(5, 'Hoang Van E', 'e@gmail.com'),
(6, 'Do Thi F', 'f@gmail.com'),
(7, 'Vu Van G', 'g@gmail.com');

INSERT INTO orders (id, customer_id, order_date, total_amount) VALUES
(1, 1, '2025-01-01', 500000),
(2, 1, '2025-01-05', 300000),
(3, 2, '2025-01-03', 150000),
(4, 3, '2025-01-07', 700000),
(5, 5, '2025-01-10', 200000),
(6, 5, '2025-01-12', 450000),
(7, 6, '2025-01-15', 100000);

SELECT c.id,c.name,c.email
FROM customers c
WHERE id IN (
    SELECT DISTINCT customer_id
    FROM orders
);
