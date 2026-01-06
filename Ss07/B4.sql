use session07;
create table b4_customers (
    id int primary key,
    name varchar(100),
    email varchar(100)
);
create table b4_orders (
    id int primary key,
    customer_id int,
    order_date date,
    total_amount decimal(10,2)
);
insert into b4_customers values
(1, 'nguyen van a', 'a@gmail.com'),
(2, 'tran thi b', 'b@gmail.com'),
(3, 'le van c', 'c@gmail.com'),
(4, 'pham thi d', 'd@gmail.com'),
(5, 'hoang van e', 'e@gmail.com');
insert into b4_orders values
(101, 1, '2023-01-10', 500000),
(102, 1, '2023-02-15', 700000),
(103, 2, '2023-03-20', 300000),
(104, 3, '2023-04-05', 900000),
(105, 3, '2023-05-18', 400000),
(106, 3, '2023-06-01', 600000);

select name,
    (select count(*) from b4_orders where b4_orders.customer_id = b4_customers.id) as so_luong_don_hang
from b4_customers;
