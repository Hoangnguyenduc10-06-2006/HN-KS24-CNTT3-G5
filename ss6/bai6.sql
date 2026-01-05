create database ss6_k1;
use ss6_k1;
drop database ss6_k1;

select p.product_name, 
	sum( oi.quantity) as `Tổng sl bán`, 
	format(sum(oi.quantity * p.price), 0, 'vi_VN') as `Tổng doanh thu`,
    format(avg(p.price), 0, 'vi_VN')  as `Giá bán tb`
from products p
join order_items oi on oi.product_id = p.product_id
join orders o on o.order_id = oi.order_id 
group by p.product_id
having sum(oi.quantity) > 1 
order by sum(oi.quantity * p.price) desc limit 5;