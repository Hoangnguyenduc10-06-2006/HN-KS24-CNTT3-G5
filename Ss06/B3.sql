USE Session06;
create table B3_orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    total_amount DECIMAL(10,2),
    status ENUM('completed')
);

insert into B3_orders (order_id, order_date, total_amount, status) values
(301, '2024-04-01', 3500000.00, 'completed'),
(302, '2024-04-01', 4200000.00, 'completed'),
(303, '2024-04-01', 3000000.00, 'completed'),
(304, '2024-04-02', 2500000.00, 'completed'),
(305, '2024-04-02', 1800000.00, 'completed'),
(306, '2024-04-03', 6000000.00, 'completed'),
(307, '2024-04-03', 5200000.00, 'completed');

select order_date,SUM(total_amount) AS total_revenue
from B3_orders
group by order_date;

select order_date,COUNT(order_id) AS total_orders
from B3_orders
group by order_date;

select order_date,SUM(total_amount) AS total_revenue,COUNT(order_id) AS total_orders
from B3_orders
group by order_date
having SUM(total_amount) > 10000000;
