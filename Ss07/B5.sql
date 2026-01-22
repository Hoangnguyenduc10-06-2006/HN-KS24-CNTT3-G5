use Session07;
create table b5_customers (
    id int primary key,
    name varchar(100),
    email varchar(100)
);
create table b5_orders (
    id int primary key,
    customer_id int,
    order_date date,
    total_amount decimal(10,2)
);

insert into b5_customers values
(1, 'nguyen van a', 'a@gmail.com'),
(2, 'tran thi b', 'b@gmail.com'),
(3, 'le van c', 'c@gmail.com'),
(4, 'pham thi d', 'd@gmail.com'),
(5, 'hoang van e', 'e@gmail.com');

insert into b5_orders values
(101, 1, '2023-01-10', 500000),
(102, 1, '2023-02-15', 700000),
(103, 2, '2023-03-20', 300000),
(104, 3, '2023-04-05', 900000),
(105, 3, '2023-05-18', 1100000),
(106, 4, '2023-06-01', 400000),
(107, 5, '2023-06-10', 600000);

select *
from b5_customers
where id in (
    select customer_id
    from b5_orders
    group by customer_id
    having sum(total_amount) = (
        select max(tong_tien)
        from (
            select sum(total_amount) as tong_tien
            from b5_orders
            group by customer_id
        ) as temp
    )
);
