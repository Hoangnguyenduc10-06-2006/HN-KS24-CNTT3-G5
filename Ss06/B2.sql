USE Session06;

CREATE TABLE B2_customers (
    customer_id INT PRIMARY KEY,
    full_name VARCHAR(255),
    city VARCHAR(255)
);

create table B2_orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    status ENUM('pending', 'completed', 'cancelled'),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES B2_customers(customer_id)
);

insert into B2_customers (customer_id, full_name, city) values
(1, 'Nguyen Van A', 'Ha Noi'),
(2, 'Tran Thi B', 'Ho Chi Minh'),
(3, 'Le Van C', 'Da Nang'),
(4, 'Pham Thi D', 'Can Tho'),
(5, 'Hoang Van E', 'Hai Phong');

insert into B2_orders (order_id, customer_id, order_date, status, total_amount) values
(201, 1, '2024-03-01', 'completed', 1500000.00),
(202, 1, '2024-03-05', 'completed', 2300000.00),
(203, 2, '2024-03-10', 'pending', 1800000.00),
(204, 3, '2024-03-12', 'completed', 3200000.00),
(205, 2, '2024-03-15', 'completed', 2700000.00);

select c.customer_id,c.full_name,SUM(o.total_amount) as total_spent
from B2_customers c
join B2_orders o on c.customer_id = o.customer_id
group by c.customer_id, c.full_name;

select c.customer_id,c.full_name,MAX(o.total_amount) as max_order_value
from B2_customers c
join B2_orders o on c.customer_id = o.customer_id
group by c.customer_id, c.full_name;

select c.customer_id,c.full_name,SUM(o.total_amount) as total_spent
from B2_customers c
join B2_orders o on c.customer_id = o.customer_id
group by c.customer_id, c.full_name
order by total_spent DESC;
