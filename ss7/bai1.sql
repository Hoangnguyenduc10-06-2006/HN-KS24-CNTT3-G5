create database ss7_k1;
use ss7_k1;
drop database ss7_k1;
-- su dung db cua bai truoc

-- Lấy danh sách đơn hàng có giá trị lớn hơn giá trị trung bình của tất cả đơn hàng
-- Subquery sử dụng hàm AVG
-- KHÔNG dùng JOIN

select id, 
	format(total_amount, 2, 'vi_VN') as total
from orders
where total_amount > (select avg(total_amount) from orders) ;