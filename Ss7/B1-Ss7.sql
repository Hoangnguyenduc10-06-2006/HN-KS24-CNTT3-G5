create database b1;
use b1;

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
(5, 'Hoàng Văn E', 'e@gmail.com'),
(6, 'Vũ Thị F', 'f@gmail.com'),
(7, 'Đỗ Văn G', 'g@gmail.com');

INSERT INTO orders (id, customer_id, order_date, total_amount) VALUES
(1, 1, '2025-01-01', 150000),
(2, 2, '2025-01-02', 200000),
(3, 1, '2025-01-05', 300000),
(4, 3, '2025-01-06', 120000),
(5, 5, '2025-01-07', 500000),
(6, 2, '2025-01-08', 180000),
(7, 4, '2025-01-09', 250000);

SELECT *
FROM customers
WHERE id IN (
    SELECT customer_id
    FROM orders
);
