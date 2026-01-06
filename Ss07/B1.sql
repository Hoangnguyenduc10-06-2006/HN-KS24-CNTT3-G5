drop database Session07;
create database Session07;
use Session07;

create table B1_customers(
	customer_id int primary key,
    customer_name varchar(100),
    customer_email varchar(100) unique
);	

create table B1_orders(
	order_id int primary key,
    customer_id int,
    order_date date,
    total_amount decimal(10,2),
    foreign key (customer_id) references B1_customers(customer_id)
);

insert into B1_customers values
(1,'Tran Anh Dung','dungoo2605@gmail.com'),
(2,'Tran Thi Tuoi','Tuotran@gmail.com'),
(3,'Tran Minh Bich','TranBich@gmail.com'),
(4,'Vu Van Doan','Vivu@gmail.com'),
(5,'Doan Chi Binh','DoanHuyng@gmail.com'),
(6,'Le Van Li','LeBi@gmail.com'),
(7,'Tran Minh Huyen','TranHuywn@gmail.com');

insert into B1_orders values 
(101,1,'2022-05-01',400000),
(102,2,'2023-04-06',300000),
(103,3,'2026-01-01',200000),
(104,1,'2022-01-27',400000),
(105,7,'2023-02-11',300000),
(106,3,'2026-12-12',200000),
(107,4,'2025-08-22',800000);


select *
from B1_customers 
where customer_id in (select customer_id from B1_orders ) 