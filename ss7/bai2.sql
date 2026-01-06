create database ss7_k1;
use ss7_k1;
drop database ss7_k1;
-- su dung db cua bai truoc

-- Hiển thị tên khách hàng
-- Hiển thị số lượng đơn hàng của từng khách
-- Sử dụng subquery trong SELECT
-- KHÔNG dùng JOIN, KHÔNG dùng GROUP BY

select id, name, 
	(select count(id)  from orders where customer_id = customers.id) as total_orders
from customers;