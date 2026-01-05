CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    price DECIMAL(10,2),
    stock INT,
    status ENUM('active', 'inactive')
);

INSERT INTO products (product_id, product_name, price, stock, status) VALUES
(1, 'Laptop Dell', 15000000, 10, 'active'),
(2, 'Chuột Logitech', 500000, 50, 'active'),
(3, 'Bàn phím cơ', 1200000, 20, 'active'),
(4, 'Tai nghe Bluetooth', 800000, 0, 'inactive'),
(5, 'Màn hình LG', 3000000, 5, 'active');

SELECT * FROM products;

SELECT * 
FROM products
WHERE status = 'active';

SELECT * 
FROM products
WHERE price > 1000000;

SELECT * 
FROM products
WHERE status = 'active'
ORDER BY price ASC;
