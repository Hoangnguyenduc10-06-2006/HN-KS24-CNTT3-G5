use session06;

create table b5_customers (
    customer_id int primary key,
    full_name varchar(255),
    city varchar(255)
);

create table b5_orders (
    order_id int primary key,
    customer_id int,
    order_date date,
    total_amount decimal(10,2),
    foreign key (customer_id) references b5_customers(customer_id)
);

insert into b5_customers (customer_id, full_name, city) values
(1, 'Nguyen Van A', 'Ha Noi'),
(2, 'Tran Thi B', 'Ho Chi Minh'),
(3, 'Le Van C', 'Da Nang'),
(4, 'Pham Thi D', 'Can Tho'),
(5, 'Hoang Van E', 'Hai Phong');

insert into b5_orders (order_id, customer_id, order_date, total_amount) values
(501, 1, '2024-06-01', 3000000.00),
(502, 1, '2024-06-05', 4500000.00),
(503, 1, '2024-06-10', 3500000.00),
(504, 2, '2024-06-02', 2000000.00),
(505, 2, '2024-06-06', 2500000.00),
(506, 3, '2024-06-03', 6000000.00),
(507, 3, '2024-06-07', 5000000.00),
(508, 3, '2024-06-11', 4000000.00),
(509, 4, '2024-06-04', 1500000.00),
(510, 5, '2024-06-08', 8000000.00);

select
    c.customer_id,
    c.full_name,
    count(o.order_id) as total_orders,
    sum(o.total_amount) as total_spent,
    avg(o.total_amount) as avg_order_value
from b5_customers c
join b5_orders o on c.customer_id = o.customer_id
group by c.customer_id, c.full_name
having count(o.order_id) >= 3
   and sum(o.total_amount) > 10000000
order by total_spent desc;
