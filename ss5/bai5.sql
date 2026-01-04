create database Session05_bai5;
use Session05_bai5;

create table customers (
customer_id INT primary key auto_increment,
full_name VARCHAR(255) ,
email VARCHAR(255) ,
city VARCHAR(255) ,
status ENUM( 'active', 'inactive') 
);

INSERT INTO customers (full_name, email, city, status)
VALUES
('Nguyen Van An', 'an.nguyen@gmail.com', 'Ha Noi', 'active'),
('Tran Thi Bich', 'bich.tran@gmail.com', 'Hai Phong', 'active'),
('Le Minh Duc', 'duc.le@gmail.com', 'Da Nang', 'inactive'),
('Pham Thu Ha', 'ha.pham@gmail.com', 'Ha Noi', 'active'),
('Vo Quang Huy', 'huy.vo@gmail.com', 'Can Tho', 'active'),
('Do Thi Lan', 'lan.do@gmail.com', 'Nam Dinh', 'inactive'),
('Nguyen Hoang Nam', 'nam.nguyen@gmail.com', 'TP Ho Chi Minh', 'active'),
('Bui Tuan Kiet', 'kiet.bui@gmail.com', 'Binh Duong', 'active'),
('Dang Thi Mai', 'mai.dang@gmail.com', 'Thanh Hoa', 'inactive'),
('Hoang Van Phuc', 'phuc.hoang@gmail.com', 'Bac Ninh', 'active'),
('Pham Quoc Bao', 'bao.pham@gmail.com', 'Quang Ninh', 'active'),
('Tran Minh Quan', 'quan.tran@gmail.com', 'Ha Noi', 'active'),
('Le Thi Hong', 'hong.le@gmail.com', 'Thai Binh', 'inactive'),
('Nguyen Duc Hieu', 'hieu.nguyen@gmail.com', 'Hai Duong', 'active'),
('Vo Thi Thu Trang', 'trang.vo@gmail.com', 'Da Lat', 'active'),
('Dang Hoang Long', 'long.dang@gmail.com', 'Vinh Phuc', 'inactive'),
('Bui Thi Kim Oanh', 'oanh.bui@gmail.com', 'Bac Giang', 'active'),
('Hoang Minh Tuan', 'tuan.hoang@gmail.com', 'Nghe An', 'active'),
('Do Van Khoa', 'khoa.do@gmail.com', 'Quang Nam', 'inactive'),
('Nguyen Thi Lan Anh', 'lananh.nguyen@gmail.com', 'Hue', 'active');

create table orders  (
order_id INT primary key auto_increment,
customer_id INT  ,  foreign key(customer_id)references customers(customer_id),
total_amount DECIMAL(10,2) ,
order_date date ,
status ENUM( 'pending', 'completed','cancelled') 
);
INSERT INTO orders (customer_id, total_amount, order_date, status)
VALUES
(1, 1500000.00, '2024-01-05', 'completed'),
(1,  500000.00, '2024-02-10', 'pending'),
(2,  750000.00, '2024-01-12', 'completed'),
(3, 1200000.00, '2024-03-01', 'cancelled'),
(4,  980000.00, '2024-02-18', 'completed'),
(4,  430000.00, '2024-03-05', 'pending'),
(5, 2100000.00, '2024-01-25', 'completed'),
(6,  650000.00, '2024-02-02', 'cancelled'),
(7, 3000000.00, '2024-03-10', 'completed'),
(7,  820000.00, '2024-03-15', 'pending'),
(8, 1450000.00, '2024-02-20', 'completed'),
(9,  560000.00, '2024-01-30', 'cancelled'),
(10, 1750000.00, '2024-03-08', 'completed'),
(11, 1850000.00, '2024-03-18', 'completed'),
(12,  920000.00, '2024-03-20', 'pending'),
(13, 1350000.00, '2024-02-25', 'completed'),
(14,  780000.00, '2024-01-28', 'cancelled'),
(15, 2450000.00, '2024-03-22', 'completed'),
(16,  610000.00, '2024-02-14', 'pending'),
(17, 1980000.00, '2024-03-12', 'completed'),
(18,  890000.00, '2024-01-19', 'cancelled'),
(19, 1620000.00, '2024-02-08', 'completed'),
(20, 2750000.00, '2024-03-25', 'pending');

select order_id as'ma don hang',customer_id as'ma khach hang', total_amount as 'tong tien', order_date as 'ngay dat',case status
																														when 'completed' then 'hoan thanh'
																														when 'pending' then 'dang xu ly'
                                                                                                                        when 'cancelled' then 'da huy hang'
																													end 'trang thai'
from orders                                                                                                                   
where status <> 'cancelled'
order by order_date desc
limit 5 ;

select order_id as'ma don hang',customer_id as'ma khach hang', total_amount as 'tong tien', order_date as 'ngay dat',case status
																														when 'completed' then 'hoan thanh'
																														when 'pending' then 'dang xu ly'
                                                                                                                        when 'cancelled' then 'da huy hang'
																													end 'trang thai'
from orders                                                                                                                   
where status <> 'cancelled'
order by order_date desc
limit 5 offset 5 ;


select order_id as'ma don hang',customer_id as'ma khach hang', total_amount as 'tong tien', order_date as 'ngay dat',case status
																														when 'completed' then 'hoan thanh'
																														when 'pending' then 'dang xu ly'
                                                                                                                        when 'cancelled' then 'da huy hang'
																													end 'trang thai'
from orders                                                                                                                   
where status <> 'cancelled'
order by order_date desc
limit 5 offset 10 ;



