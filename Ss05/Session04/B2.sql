USE session04;

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(255),
    email VARCHAR(255),
    city VARCHAR(255),
    status ENUM('active', 'inactive')
);

INSERT INTO customers (customer_id, full_name, email, city, status) VALUES
(1, 'Nguyễn Văn An', 'an.nguyen@gmail.com', 'TP.HCM', 'active'),
(2, 'Trần Thị Bình', 'binh.tran@yahoo.com', 'Hà Nội', 'active'),
(3, 'Lê Văn Cường', 'cuong.le@hotmail.com', 'Đà Nẵng', 'inactive'),
(4, 'Phạm Minh Duy', 'duy.pham@gmail.com', 'TP.HCM', 'active'),
(5, 'Hoàng Thị Lan', 'lan.hoang@gmail.com', 'Hà Nội', 'active'),
(6, 'Vũ Văn Hùng', 'hung.vu@gmail.com', 'Hải Phòng', 'active'),
(7, 'Đỗ Thị Mai', 'mai.do@gmail.com', 'TP.HCM', 'inactive'),
(8, 'Bùi Văn Khánh', 'khanh.bui@gmail.com', 'Cần Thơ', 'active');

SELECT * FROM customers;

SELECT * FROM customers WHERE city = 'TP.HCM';

SELECT * FROM customers WHERE status = 'active' AND city = 'Hà Nội';

SELECT * FROM customers ORDER BY full_name ASC;