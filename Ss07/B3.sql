use session07;
create table b3_orders (
    id int primary key,
    customer_id int,
    order_date date,
    total_amount decimal(10,2)
);
insert into b3_orders values
(1, 1, '2023-01-10', 500000),
(2, 2, '2023-02-15', 1200000),
(3, 3, '2023-03-20', 800000),
(4, 4, '2023-04-05', 2000000),
(5, 5, '2023-05-18', 300000),
(6, 2, '2023-06-01', 1500000);
select *
from b3_orders
where total_amount > (
    select avg(total_amount)
    from b3_orders
);
