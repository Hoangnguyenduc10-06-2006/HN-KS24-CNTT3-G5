create database ss6_k1;
use ss6_k1;
drop database ss6_k1;

create table customers(
	customer_id int primary key auto_increment,
    full_name varchar(255) not null,
    city varchar(255) not null
);

create table orders (
	order_id int primary key auto_increment,
    customer_id int not null,
    order_date date not null,
    status enum('pending', 'completed', 'cancelled') default('pending'),
    
    constraint fk_orders_customers foreign key(customer_id) references customers(customer_id)
);

insert into customers(full_name, city) values
('Nguyễn Văn An', 'Hà Nội'),
('Trần Thị Bình', 'TP. Hồ Chí Minh'),
('Lê Hoàng Long', 'Đà Nẵng'),
('Phạm Minh Đức', 'Hải Phòng'),
('Vũ Thị Hoa', 'Cần Thơ'),
('Đặng Văn Hùng', 'Huế'),
('Bùi Tuyết Mai', 'Nha Trang'),
('Ngô Quang Hải', 'Vũng Tàu'),
('Đỗ Thùy Linh', 'Quảng Ninh'),
('Hoàng Anh Tuấn', 'Nam Định');
    
insert into orders (customer_id, order_date, status) values
(1, '2025-12-20', 'completed'),
(2, '2025-12-21', 'completed'),
(3, '2025-12-25', 'pending'),
(4, '2025-12-28', 'cancelled'),
(5, '2026-01-01', 'completed'),
(1, '2026-01-02', 'pending'),
(6, '2026-01-03', 'completed'),
(7, '2026-01-04', 'pending'),
(8, '2026-01-05', 'cancelled'),
(10, '2026-01-05', 'pending');

select o.*, c.full_name from orders o
join customers c on c.customer_id = o.customer_id;

select c.full_name, count(o.order_id) as `Số lượng đơn hàng` 
from customers c
left join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.full_name;

select c.full_name, count(o.order_id) as `Số lượng đơn hàng` 
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.full_name;