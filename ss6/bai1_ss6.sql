DROP DATABASE IF EXISTS ecommerce_demo;
CREATE DATABASE ecommerce_demo;
USE ecommerce_demo;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name   VARCHAR(255) NOT NULL,
    city        VARCHAR(255)
);

CREATE TABLE orders (
    order_id    INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date  DATE NOT NULL,
    status      ENUM('pending','completed','cancelled') NOT NULL,
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);



INSERT INTO customers VALUES
(1, 'Nguyễn Văn An', 'Hà Nội'),
(2, 'Trần Thị Bình', 'Đà Nẵng'),
(3, 'Lê Văn Cường', 'Hồ Chí Minh'),
(4, 'Phạm Thị Dao', 'Hà Nội'),
(5, 'Hoàng Văn Em', 'Cần Thơ');

INSERT INTO orders VALUES
(101, 1, '2025-01-05', 'completed'),
(102, 1, '2025-01-06', 'completed'),
(103, 2, '2025-01-07', 'pending'),
(104, 3, '2025-01-08', 'completed'),
(105, 3, '2025-01-09', 'cancelled');

SELECT o.order_id,
       o.order_date,
       o.status,
       c.full_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

SELECT c.customer_id,
       c.full_name,
       COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name;

SELECT c.customer_id,
       c.full_name,
       COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name
HAVING COUNT(o.order_id) >= 1;
