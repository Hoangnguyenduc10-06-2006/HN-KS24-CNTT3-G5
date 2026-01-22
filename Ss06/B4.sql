use session06;

create table b4_products (
    product_id int primary key,
    product_name varchar(255),
    price decimal(10,2)
);

create table b4_orders (
    order_id int primary key,
    order_date date
);

create table b4_order_items (
    order_id int,
    product_id int,
    quantity int,
    foreign key (order_id) references b4_orders(order_id),
    foreign key (product_id) references b4_products(product_id)
);

insert into b4_products (product_id, product_name, price) values
(1, 'Laptop', 15000000.00),
(2, 'Smartphone', 8000000.00),
(3, 'Tablet', 6000000.00),
(4, 'Headphone', 2000000.00),
(5, 'Keyboard', 1000000.00);

insert into b4_orders (order_id, order_date) values
(401, '2024-05-01'),
(402, '2024-05-02'),
(403, '2024-05-03'),
(404, '2024-05-04'),
(405, '2024-05-05');

insert into b4_order_items (order_id, product_id, quantity) values
(401, 1, 1),
(401, 2, 2),
(402, 3, 3),
(403, 1, 1),
(404, 2, 1),
(404, 4, 4),
(405, 3, 2);

select
    p.product_id,
    p.product_name,
    sum(oi.quantity) as total_quantity_sold
from b4_products p
join b4_order_items oi on p.product_id = oi.product_id
group by p.product_id, p.product_name;

select
    p.product_id,
    p.product_name,
    sum(oi.quantity * p.price) as revenue
from b4_products p
join b4_order_items oi on p.product_id = oi.product_id
group by p.product_id, p.product_name;

select
    p.product_id,
    p.product_name,
    sum(oi.quantity * p.price) as revenue
from b4_products p
join b4_order_items oi on p.product_id = oi.product_id
group by p.product_id, p.product_name
having sum(oi.quantity * p.price) > 5000000;
