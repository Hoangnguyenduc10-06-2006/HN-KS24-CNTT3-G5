create database b2;
use b2;

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
(1, 'Áo thun', 150000),
(2, 'Quần jeans', 350000),
(3, 'Giày thể thao', 800000),
(4, 'Mũ lưỡi trai', 120000),
(5, 'Túi xách', 450000),
(6, 'Áo khoác', 600000),
(7, 'Dép', 90000);

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 2, 1),
(2, 5, 1),
(3, 1, 1),
(3, 4, 2),
(4, 6, 1);

SELECT *
FROM products
WHERE id IN (
    SELECT product_id
    FROM order_items
);
