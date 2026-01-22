use Session07;

create table B2_products(
	product_id int primary key, 
    product_name varchar(100) ,
    product_price decimal (10,2)
);

create table B2_order_items (
	order_id int,
    product_id int,
    primary key (order_id,product_id),
    quantity int
);

insert into B2_products values 
(1, 'Laptop Dell', 15000000),
(2, 'Chuột Logitech', 500000),
(3, 'Bàn phím cơ', 1200000),
(4, 'Màn hình Samsung', 4500000),
(5, 'Tai nghe Sony', 2000000),
(6, 'Webcam Logitech', 1800000),
(7, 'USB 64GB', 300000);

insert into  B2_order_items values 
(101, 1, 1),
(101, 2, 2),
(102, 3, 1),
(103, 1, 1),
(104, 4, 2),
(105, 5, 1),
(106, 2, 1);

select *
from B2_products as SanPhamDaTungDuocBan
where product_id in  (select product_id from B2_order_items) 