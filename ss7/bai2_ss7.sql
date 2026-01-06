

CREATE DATABASE IF NOT EXISTS ecommerce_subquery2;
USE ecommerce_subquery2;

DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS products;

CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2)
);

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO products (id, name, price) VALUES
(1, 'Laptop', 15000000),
(2, 'Chuột', 200000),
(3, 'Bàn phím', 500000),
(4, 'Màn hình', 3000000),
(5, 'Tai nghe', 800000),
(6, 'USB', 150000),
(7, 'Webcam', 1200000);

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(101, 1, 1),
(101, 2, 2),
(102, 3, 1),
(103, 1, 1),
(104, 5, 1),
(105, 6, 3),
(106, 4, 1);

SELECT *
FROM products
WHERE id IN (
    SELECT DISTINCT product_id
    FROM order_items
);
