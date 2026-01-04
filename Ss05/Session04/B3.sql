USE session04;

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    total_amount DECIMAL(10,2),
    order_date DATE,
    status ENUM('pending', 'completed', 'cancelled')
);

INSERT INTO orders (order_id, customer_id, total_amount, order_date, status) VALUES
(1, 1, 299000, '2025-12-15', 'completed'),
(2, 2, 649000, '2025-12-20', 'completed'),
(3, 4, 589800, '2025-12-25', 'pending'),
(4, 5, 1099000, '2026-01-01', 'completed'),
(5, 1, 849000, '2026-01-02', 'cancelled'),
(6, 6, 3599000, '2026-01-03', 'completed'),
(7, 8, 2199000, '2025-12-10', 'completed'),
(8, 3, 500000, '2025-11-30', 'completed');

SELECT * FROM orders WHERE status = 'completed';

SELECT * FROM orders WHERE total_amount > 5000000;

SELECT * FROM orders ORDER BY order_date DESC LIMIT 5;

SELECT * FROM orders WHERE status = 'completed' ORDER BY total_amount DESC;