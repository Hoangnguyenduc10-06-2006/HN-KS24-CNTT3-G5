use Session07;
create table b6_orders (
    id int primary key,
    customer_id int,
    order_date date,
    total_amount decimal(10,2)
);

insert into b6_orders values
(1, 1, '2023-01-10', 500000),
(2, 1, '2023-02-15', 700000),
(3, 2, '2023-03-20', 300000),
(4, 3, '2023-04-05', 900000),
(5, 3, '2023-05-18', 1100000),
(6, 4, '2023-06-01', 400000),
(7, 5, '2023-06-10', 600000);

select customer_id, sum(total_amount) as tong_tien
from b6_orders
group by customer_id
having sum(total_amount) > (
    select avg(tong_tien)
    from (
        select sum(total_amount) as tong_tien
        from b6_orders
        group by customer_id
    ) as temp
);
