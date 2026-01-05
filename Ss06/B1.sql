CREATE DATABASE Session06;
USE Session06;

CREATE TABLE B1_customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(255),
    city VARCHAR(255)
);

CREATE TABLE B1_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status ENUM('pending', 'completed', 'cancelled'),
    FOREIGN KEY (customer_id) REFERENCES B1_customers(customer_id)
);

INSERT INTO B1_customers (customer_id, full_name, city) VALUES
(1, 'Nguyen Van A', 'Ha Noi'),
(2, 'Tran Thi B', 'Ho Chi Minh'),
(3, 'Le Van C', 'Da Nang'),
(4, 'Pham Thi D', 'Can Tho'),
(5, 'Hoang Van E', 'Hai Phong');

INSERT INTO B1_orders (order_id, customer_id, order_date, status) VALUES
(101, 1, '2024-01-10', 'completed'),
(102, 1, '2024-01-15', 'pending'),
(103, 2, '2024-02-01', 'completed'),
(104, 3, '2024-02-05', 'cancelled'),
(105, 2, '2024-02-10', 'pending');

SELECT
    o.order_id,
    c.full_name,
    o.order_date,
    o.status
FROM B1_orders o
JOIN B1_customers c ON o.customer_id = c.customer_id;

SELECT
    c.customer_id,
    c.full_name,
    COUNT(o.order_id) AS total_orders
FROM B1_customers c
LEFT JOIN B1_orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name;

SELECT
    c.customer_id,
    c.full_name,
    COUNT(o.order_id) AS total_orders
FROM B1_customers c
JOIN B1_orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name
HAVING COUNT(o.order_id) >= 1;
