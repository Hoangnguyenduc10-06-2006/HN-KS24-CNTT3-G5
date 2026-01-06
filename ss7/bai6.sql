create database ss7_k1;
use ss7_k1;
drop database ss7_k1;
-- su dung db cua bai truoc

-- Lấy danh sách khách hàng có tổng tiền mua hàng lớn hơn tổng tiền trung bình của tất cả khách hàng
-- Subquery dùng hàm AVG
-- Truy vấn chính dùng GROUP BY và HAVING
-- KHÔNG dùng JOIN
select customer_id, sum(total_amount) from orders 
group by customer_id
having sum(total_amount) > (select avg(total_amount) from orders)
;

-- lay ds co ten kh
select id, name from customers 
where 
	(select sum(total_amount) from orders where customer_id = customers.id) 
    > (select avg(total_amount) from orders) ;