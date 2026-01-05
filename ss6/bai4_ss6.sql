USE ecommerce_demo;

INSERT INTO products VALUES
(10, 'Laptop Dell', 15000000),
(20, 'Chuột Logitech', 500000),
(30, 'Bàn phím cơ', 1200000),
(40, 'Tai nghe Sony', 2500000),
(50, 'Màn hình LG', 6000000);

INSERT INTO order_items VALUES
(101, 1, 1),
(101, 2, 2),
(102, 3, 1),
(103, 2, 3),
(104, 5, 1),
(105, 4, 2);

SELECT p.product_id, p.product_name, SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;

SELECT p.product_id, p.product_name, SUM(oi.quantity * p.price) AS revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;

SELECT p.product_id, p.product_name, SUM(oi.quantity * p.price) AS revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
HAVING revenue > 5000000;
