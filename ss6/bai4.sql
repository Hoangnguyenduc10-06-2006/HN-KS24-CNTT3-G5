create database ss6_k1;
use ss6_k1;
drop database ss6_k1;

alter table orders
add column total_amount decimal(10,2) check(total_amount > 0);

update orders set total_amount = 1000000 where order_id = 1;
update orders set total_amount = 2000000 where order_id = 2;
update orders set total_amount = 3000000 where order_id = 3;
update orders set total_amount = 4000000 where order_id = 4;
update orders set total_amount = 1500000 where order_id = 5;
update orders set total_amount = 3400000 where order_id = 6;
update orders set total_amount = 29000000 where order_id = 7;
update orders set total_amount = 33000000 where order_id = 8;
update orders set total_amount = 40000000 where order_id = 9;
update orders set total_amount = 100000 where order_id = 10;

select c.full_name, format(sum(o.total_amount), 0, 'vi_VN') as `Tổng tiền`
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id;

select c.full_name, format(max(o.total_amount), 0, 'vi_VN')  as `Đơn cao nhất`
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id;

select c.full_name, format(sum(o.total_amount), 0, 'vi_VN') as `Tổng tiền`
from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id
order by sum(o.total_amount) desc;