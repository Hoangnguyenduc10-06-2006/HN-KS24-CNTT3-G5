create database ss6_k1;
use ss6_k1;
drop database ss6_k1;

select c.full_name, count(distinct o.order_id) as `Tổng đơn`, 
	format(sum(oi.quantity * p.price), 0, 'vi_VN') as `Tổng tiền`,
    format(sum(oi.quantity * p.price)/count(distinct o.order_id), 0, 'vi_VN')  as `TB đơn hàng`
from customers c
join orders o on c.customer_id = o.customer_id
join order_items oi on o.order_id = oi.order_id
join products p on oi.product_id = p.product_id
group by c.customer_id
having count(distinct o.order_id) > 1 and sum(oi.quantity * p.price) > 10000000
order by sum(oi.quantity * p.price) desc;