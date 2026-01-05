create database ss6_k1;
use ss6_k1;
drop database ss6_k1;

create table products(
	product_id int primary key auto_increment,
    product_name varchar(255) not null,
    price decimal(10,2) not null check(price > 0)
);

create table order_items(
	order_id int not null,
    product_id int not null,
    quantity int not null,
    
    constraint fk_oi_o foreign key(order_id) references orders(order_id),
    constraint fk_oi_p foreign key(product_id) references products(product_id),
    constraint chb_quantity check(quantity > 0)
);

insert into products (product_name, price) values
('iPhone 15 Pro Max', 34990000),
('Samsung Galaxy S24 Ultra', 29990000),
('MacBook Air M3', 27500000),
('Sony WH-1000XM5', 8500000),
('iPad Pro M2', 22000000),
('Apple Watch Series 9', 10500000),
('Bàn phím cơ Keychron K2', 1850000),
('Chuột Logitech MX Master 3S', 2500000),
('Màn hình Dell Ultrasharp', 12500000),
('Loa Marshall Stanmore III', 9000000);

insert into order_items (order_id, product_id, quantity) values
(1, 1, 1), (1, 8, 2), (2, 2, 1), (3, 3, 1), (4, 10, 1),
(5, 4, 2), (6, 7, 3), (7, 5, 1), (8, 9, 1), (10, 6, 1);

select p.product_id, p.product_name, sum(oi.quantity) as `Số lượng đã bán`
from products p
join order_items oi on oi.product_id = p.product_id
group by p.product_id  ;

select p.product_name, format(sum(oi.quantity * p.price), 0, 'vi_VN')  as `Doanh thu`
from products p
left join order_items oi on oi.product_id = p.product_id
group by p.product_name  
order by sum(oi.quantity * p.price) desc;

select p.product_name, format(sum(oi.quantity * p.price), 0, 'vi_VN')  as `Doanh thu`
from products p
left join order_items oi on oi.product_id = p.product_id
group by p.product_name  
having sum(oi.quantity * p.price) > 10000000
order by sum(oi.quantity * p.price) desc;