USE session04;

DROP TABLE IF EXISTS products;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    price DECIMAL(10,2),
    stock INT,
    status ENUM('active', 'inactive')
);

INSERT INTO products (product_id, product_name, price, stock, status) VALUES
(1, 'iPhone 15 Pro', 2999000, 50, 'active'),
(2, 'Samsung Galaxy S24', 24990000 ,30, 'active'),
(3, 'MacBook Air M2', 28990000, 20, 'active'),
(4, 'Tai nghe AirPods Pro', 649000, 100, 'active'),
(5, 'Đồng hồ Apple Watch Series 9', 10990000, 0, 'inactive'),
(6, 'Laptop Dell XPS 13', 359900000, 15, 'active'),
(7, 'Tai nghe Sony WH-1000XM5', 8490000, 80, 'active'),
(8, 'iPad Pro 11 inch', 21990000, 25, 'inactive');

SELECT * FROM products;

SELECT * FROM products WHERE status = 'active';

SELECT * FROM products WHERE price > 1000000;

SELECT * FROM products WHERE status = 'active' ORDER BY price ASC;