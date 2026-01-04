create database Session05_bai3;
use Session05_bai3;

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
('Hoang Van Phuc', 'phuc.hoang@gmail.com', 'Bac Ninh', 'active');

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
(10, 1750000.00, '2024-03-08', 'completed');

select order_id as'ma don hang',customer_id as'ma khach hang', total_amount as 'tong tien', order_date as 'ngay dat',case status
																														when 'completed' then 'hoan thanh'
																														when 'pending' then 'dang xu ly'
                                                                                                                        when 'cancelled' then 'da huy hang'
																													end 'trang thai'
from orders                                                                                                                   
where status = 'completed';

select order_id as'ma don hang',customer_id as'ma khach hang', total_amount as 'tong tien', order_date as 'ngay dat',case status
																														when 'completed' then 'hoan thanh'
																														when 'pending' then 'dang xu ly'
                                                                                                                        when 'cancelled' then 'da huy hang'
																													end 'trang thai'
from orders                                                                                                                   
where total_amount > 5000000;

select order_id as'ma don hang',customer_id as'ma khach hang', total_amount as 'tong tien', order_date as 'ngay dat',case status
																														when 'completed' then 'hoan thanh'
																														when 'pending' then 'dang xu ly'
                                                                                                                        when 'cancelled' then 'da huy hang'
																													end 'trang thai'
from orders                                                                                                                   
order by order_date desc;

select order_id as'ma don hang',customer_id as'ma khach hang', total_amount as 'tong tien', order_date as 'ngay dat',case status
																														when 'completed' then 'hoan thanh'
																														when 'pending' then 'dang xu ly'
                                                                                                                        when 'cancelled' then 'da huy hang'
																													end 'trang thai'
from orders          
where status = 'completed'                                                                                                         
order by total_amount desc
