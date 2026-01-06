create database ss7_k1;
use ss7_k1;
drop database ss7_k1;

create table customers(
	id int primary key auto_increment,
    name varchar(255) not null,
    email varchar(255) not null unique
);
create table orders(
	id int primary key auto_increment,
    customer_id int not null,
    order_date date not null,
    total_amount decimal(10,2) not null,
    constraint chb_total_amount check(total_amount > 0),
    constraint fk_orders_customers foreign key(customer_id) references customers(id)
);

create table products (
	id int primary key auto_increment,
    name varchar(255) not null,
    price decimal(10,2) not null check(price > 0)
);
create table order_items (
	order_id int not null,
    product_id int not null,
    quantity int not null check(quantity > 0),
	constraint pk_order_items primary key(order_id, product_id),
    constraint fk_order_items_products foreign key(product_id) references products(id),
    constraint fk_order_items_orders foreign key(order_id) references orders(id)
);

insert into products (name, price) values
('iPhone 15 Pro', 25000.00),    
('Samsung S24 Ultra', 23000.00), 
('MacBook M3', 35000.00),      
('AirPods Pro 2', 5000.00),    
('iPad Pro M2', 20000.00),      
('Sony WH-1000XM5', 8000.00),  
('Logitech MX Master 3', 2500.00),
('Dell Ultrasharp', 12000.00),  
('Apple Watch Series 9', 9000.00),
('Mechanical Keyboard', 3000.00); 

insert into order_items (order_id, product_id, quantity) values
(1, 1, 1), (1, 2, 1), (1, 3, 1),
(2, 1, 2),  (2, 4, 1),
(3, 2, 1), (4, 5, 1),  (5, 6, 2),
(6, 7, 1), (7, 8, 3);

-- Lấy danh sách sản phẩm đã từng được bán
-- Subquery lấy product_id từ bảng order_items
-- Sử dụng IN
-- KHÔNG dùng JOIN
select id, name from products 
where id = any(select distinct product_id from order_items);