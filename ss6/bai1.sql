create database ss6_k1;
use ss6_k1;
drop database ss6_k1;

select o.order_date, format(sum(o.total_amount), 0, 'vi_VN') as `Doanh thu`
from orders o
join customers c on c.customer_id = o.customer_id
group by o.order_date;

select o.order_date, count(o.order_id) as `Số đơn`
from orders o
join customers c on c.customer_id = o.customer_id
group by o.order_date;

select o.order_date, format(sum(o.total_amount), 0, 'vi_VN') as `Doanh thu`
from orders o
join customers c on c.customer_id = o.customer_id
group by o.order_date
having sum(o.total_amount) > 10000000;