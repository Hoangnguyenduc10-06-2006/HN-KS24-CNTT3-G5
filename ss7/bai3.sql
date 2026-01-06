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

insert into customers (name, email) values
('Nguyễn Văn A', 'vana@example.com'),
('Trần Thị B', 'thib@example.com'),
('Lê Văn C', 'vanc@example.com'),
('Phạm Minh D', 'minhd@example.com'),
('Hoàng Thị E', 'thie@example.com'),
('Ngô Văn F', 'vanf@example.com'),
('Đỗ Thị G', 'thig@example.com'),
('Bùi Văn H', 'vanh@example.com'),
('Lý Thị I', 'thii@example.com'),
('Vũ Văn K', 'vank@example.com');

insert into orders (customer_id, order_date, total_amount) values
(1, '2026-01-01', 150.50),
(1, '2026-01-02', 200.00),
(1, '2026-01-02', 50.25),
(2, '2026-01-03', 1200.00),
(2, '2026-01-04', 85.00),
(6, '2026-01-04', 310.75),
(7, '2026-01-05', 45.00),
(8, '2026-01-05', 99.99),
(9, '2026-01-06', 250.00),
(10, '2026-01-06', 120.00);

-- Lấy danh sách khách hàng đã từng đặt đơn hàng
-- Sử dụng subquery trong WHERE
-- KHÔNG dùng JOIN
select distinct c.id, c.name from  customers c 
where c.id = any(select distinct customer_id from orders) ;