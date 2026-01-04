create database Session05_bai1;
use Session05_bai1;

create table products (
product_id INT primary key auto_increment,
product_name VARCHAR(255) ,
price DECIMAL(10,2) ,
stock INT ,
status ENUM( 'active', 'inactive') 
);

INSERT INTO products (product_name, price, stock, status)
VALUES
('Laptop Dell Inspiron 15', 18500000.00, 20, 'active'),
('Chuột Logitech M185', 350000.00, 100, 'active'),
('Bàn phím cơ DareU EK87', 890000.00, 50, 'active'),
('Màn hình Samsung 24 inch', 3200000.00, 30, 'active'),
('Tai nghe Sony WH-1000XM4', 6500000.00, 15, 'active'),
('Ổ cứng SSD Kingston 512GB', 1450000.00, 40, 'active'),
('USB Sandisk 64GB', 250000.00, 80, 'active'),
('Webcam Logitech C920', 2100000.00, 25, 'inactive'),
('Loa Bluetooth JBL Go 3', 990000.00, 60, 'active'),
('Sạc dự phòng Xiaomi 10000mAh', 520000.00, 70, 'active');


select 	product_id as 'ma san pham',
		product_name as 'ten san pham',
        price as 'gia san pham',
        stock as 'mton kho',
         case status 
        when 'active' then 'dang ban' 
        when 'inactive' then 'dang ko ban' 
        end as 'trang thai'
	from products ;
    
select 	product_id as 'ma san pham',
		product_name as 'ten san pham',
        price as 'gia san pham',
        stock as 'mton kho',
         case status 
        when 'active' then 'dang ban' 
        when 'inactive' then 'dang ko ban' 
        end as 'trang thai'
	from products 
    where status = 'active' ;    
    
select 	product_id as 'ma san pham',
		product_name as 'ten san pham',
        price as 'gia san pham',
        stock as 'mton kho',
         case status 
        when 'active' then 'dang ban' 
        when 'inactive' then 'dang ko ban' 
        end as 'trang thai'
	from products 
    WHERE price > 1000000; 
    
select 	product_id as 'ma san pham',
		product_name as 'ten san pham',
        price as 'gia san pham',
        stock as 'mton kho',
         case status 
        when 'active' then 'dang ban' 
        when 'inactive' then 'dang ko ban' 
        end as 'trang thai'
	from products 
    WHERE price > 1000000;     
    
 select product_id as 'ma san pham',
		product_name as 'ten san pham',
        price as 'gia san pham',
        stock as 'mton kho',
         case status 
        when 'active' then 'dang ban' 
        when 'inactive' then 'dang ko ban' 
        end as 'trang thai'
	from products 
    WHERE status = 'active'
    order by price asc;        
    

    