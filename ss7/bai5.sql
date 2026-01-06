create database ss7_k1;
use ss7_k1;
drop database ss7_k1;
-- su dung db cua bai truoc

-- Tìm khách hàng có tổng số tiền mua hàng lớn nhất
-- Sử dụng ít nhất 2 cấp subquery
-- Dùng các hàm SUM và MAX
-- KHÔNG dùng JOIN

select id, name from customers 
where 
	(select sum(total_amount) from orders where customer_id = customers.id ) = 
	(select max(tong_chi_tieu) 
		from (select sum(total_amount) as tong_chi_tieu from orders group by customer_id) 
	as chi_tieu_max)
;

select customer_id, sum(total_amount) as tong_chi_tieu from orders group by customer_id order by tong_chi_tieu desc;