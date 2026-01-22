use session06;

create table b6_products (
    product_id int primary key,
    product_name varchar(255),
    price decimal(10,2)
);

create table b6_orders (
    order_id int primary key,
    order_date date
);

create table b6_order_items (
    order_id int,
    product_id int,
    quantity int,
    foreign key (order_id) references b6_orders(order_id),
    foreign key (product_id) references b6_products(product_id)
);

insert into b6_products (product_id, product_name, price) values
(1, 'Laptop', 15000000.00),
(2, 'Smartphone', 8000000.00),
(3, 'Tablet', 6000000.00),
(4, 'Headphone', 2000000.00),
(5, 'Keyboard', 1000000.00),
(6, 'Mouse', 500000.00);

insert into b6_orders (order_id, order_date) values
(601, '2024-07-01'),
(602, '2024-07-02'),
(603, '2024-07-03'),
(604, '2024-07-04'),
(605, '2024-07-05'),
(606, '2024-07-06');

insert into b6_order_items (order_id, product_id, quantity) values
(601, 1, 3),
(602, 1, 4),
(603, 1, 5),
(604, 2, 6),
(605, 2, 5),
(606, 3, 10),
(601, 4, 8),
(602, 4, 5),
(603, 5, 12),
(604, 6, 15);

select
    p.product_name,
    sum(oi.quantity) as total_quantity_sold,
    sum(oi.quantity * p.price) as total_revenue,
    avg(oi.quantity * p.price) as avg_order_value
from b6_products p
join b6_order_items oi on p.product_id = oi.product_id
group by p.product_id, p.product_name
having sum(oi.quantity) >= 10
order by total_revenue desc
limit 5;
