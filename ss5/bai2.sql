create database Session05_bai2;
use Session05_bai2;

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


select 	customer_id as 'ma khach hang',
		full_name as 'ten khach hanh',
        email as 'eamil khach hang' ,
        city as 'thanh pho', 
        case status
        when 'active' then 'hoat dong'
        when 'inactive' then 'khong hoat dong'
        end as'trang thai'
	from customers;

select 	customer_id as 'ma khach hang',
		full_name as 'ten khach hanh',
        email as 'eamil khach hang' ,
        city as 'thanh pho', 
        case status
        when 'active' then 'hoat dong'
        when 'inactive' then 'khong hoat dong'
        end as'trang thai'
	from customers 
    where city='TP Ho Chi Minh';

select 	customer_id as 'ma khach hang',
		full_name as 'ten khach hanh',
        email as 'eamil khach hang' ,
        city as 'thanh pho', 
        case status
        when 'active' then 'hoat dong'
        when 'inactive' then 'khong hoat dong'
        end as'trang thai'
	from customers 
    where city='Ha Noi' and status = 'active';   
    
select 	customer_id as 'ma khach hang',
		full_name as 'ten khach hanh',
        email as 'eamil khach hang' ,
        city as 'thanh pho', 
        case status
        when 'active' then 'hoat dong'
        when 'inactive' then 'khong hoat dong'
        end as'trang thai'
	from customers 
    order by full_name asc;         
