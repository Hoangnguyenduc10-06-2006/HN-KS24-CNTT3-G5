
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name   VARCHAR(255),
    city        VARCHAR(255)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status ENUM('pending','completed','cancelled'),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    price DECIMAL(10,2)
);

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1, 'Nguyễn Văn An', 'Hà Nội'),
(2, 'Trần Thị Bình', 'Đà Nẵng'),
(3, 'Lê Văn Cường', 'Hồ Chí Minh');

INSERT INTO products VALUES
(1, 'Laptop Dell', 15000000),
(2, 'Chuột Logitech', 500000),
(3, 'Bàn phím cơ', 1200000),
(4, 'Tai nghe Sony', 2500000),
(5, 'Màn hình LG', 6000000),
(6, 'Webcam Logitech', 1800000);

INSERT INTO orders VALUES
(101, 1, '2024-08-01', 'completed', 3000000),
(102, 1, '2024-08-02', 'completed', 5000000),
(103, 2, '2024-08-03', 'completed', 7000000),
(104, 2, '2024-08-04', 'completed', 6000000),
(105, 3, '2024-08-05', 'completed', 8000000),
(106, 3, '2024-08-06', 'completed', 4000000),
(107, 1, '2024-08-07', 'pending',   2000000),
(108, 2, '2024-08-08', 'completed', 9000000);

INSERT INTO order_items VALUES
(101, 1, 1),
(101, 2, 4),
(102, 2, 5),
(102, 3, 2),
(103, 2, 3),
(103, 4, 1),
(104, 2, 4),
(104, 5, 1),
(105, 2, 6),
(105, 6, 2),
(106, 2, 5),
(106, 3, 1),
(108, 2, 7),
(108, 4, 2);

SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold,
    SUM(oi.quantity * p.price) AS total_revenue,
    AVG(p.price) AS avg_price
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.status = 'completed'
GROUP BY p.product_id, p.product_name
HAVING SUM(oi.quantity) >= 10
ORDER BY total_revenue DESC
LIMIT 5;
