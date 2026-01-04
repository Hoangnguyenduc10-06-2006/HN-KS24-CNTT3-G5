create database Session05_bai4;
use Session05_bai4;

create table products (
product_id INT primary key auto_increment,
product_name VARCHAR(255) ,
price DECIMAL(10,2) ,
stock INT ,
sold_quantity int ,
status ENUM( 'active', 'inactive') 
);


INSERT INTO products (product_name, price, stock, sold_quantity, status)
VALUES
('Laptop Dell Inspiron 15', 18000000, 20, 15, 'active'),
('iPhone 13',              22000000, 30, 28, 'active'),
('Samsung Galaxy S22',     19500000, 25, 20, 'active'),
('Tai nghe AirPods Pro',    5500000,  40, 35, 'active'),
('Chuột Logitech MX Master',2500000,  50, 42, 'active'),
('Bàn phím cơ Keychron K6', 3200000,  35, 30, 'active'),
('Màn hình LG 27 inch',     6500000,  18, 12, 'inactive'),
('Ổ cứng SSD Samsung 1TB',  2800000,  45, 38, 'active'),
('Loa Bluetooth JBL',       4200000,  22, 17, 'active'),
('Webcam Logitech C920',    3100000,  28, 25, 'inactive'),
('Laptop HP Pavilion 14',        16500000, 25, 18, 'active'),
('Laptop Asus Vivobook 15',      14500000, 30, 22, 'active'),
('MacBook Air M1',               23500000, 15, 14, 'active'),
('iPad Gen 10',                  12500000, 40, 33, 'active'),
('iPad Pro M2',                  28500000, 12, 10, 'active'),
('Apple Watch Series 9',          9500000,  35, 27, 'active'),
('Samsung Galaxy Watch 6',        8500000,  28, 20, 'active'),
('Tai nghe Sony WH-1000XM5',      8900000,  20, 16, 'active'),
('Tai nghe JBL Tune 510BT',       1200000,  60, 45, 'active'),
('Chuột Gaming Logitech G502',   1800000,  50, 39, 'active'),
('Bàn phím Gaming Razer BlackWidow',4200000, 22, 17, 'active'),
('Màn hình Samsung 24 inch',       4200000, 26, 19, 'active'),
('Màn hình Dell 27 inch',           7200000, 14, 11, 'inactive'),
('Ổ cứng HDD WD 2TB',               2300000, 40, 31, 'active'),
('RAM Kingston 16GB DDR4',          1600000, 55, 48, 'active'),
('Card đồ họa RTX 3060',           10500000, 10,  8, 'inactive'),
('Card đồ họa RTX 4060',           12500000, 12,  9, 'active'),
('Router Wifi TP-Link AX3000',      2800000, 33, 26, 'active'),
('Máy in HP LaserJet 107a',         3900000, 18, 12, 'active'),
('Máy quét Canon Lide 300',         2700000, 21, 15, 'inactive');


select 	product_id as 'ma san pham',
		product_name as 'ten san pham',
        price as 'gia san pham',
        stock as 'mton kho',
        sold_quantity as 'so luong da ban',
         case status 
        when 'active' then 'dang ban' 
        when 'inactive' then 'dang ko ban' 
        end as 'trang thai'
	from products 
    order by sold_quantity desc
    limit 10;
    
select 	product_id as 'ma san pham',
		product_name as 'ten san pham',
        price as 'gia san pham',
        stock as 'mton kho',
        sold_quantity as 'so luong da ban',
         case status 
        when 'active' then 'dang ban' 
        when 'inactive' then 'dang ko ban' 
        end as 'trang thai'
	from products 
    order by sold_quantity desc
    limit 5 offset 10 ;    
    
    select 	product_id as 'ma san pham',
		product_name as 'ten san pham',
        price as 'gia san pham',
        stock as 'mton kho',
        sold_quantity as 'so luong da ban',
         case status 
        when 'active' then 'dang ban' 
        when 'inactive' then 'dang ko ban' 
        end as 'trang thai'
	from products 
    where price < 2000000
    order by sold_quantity desc