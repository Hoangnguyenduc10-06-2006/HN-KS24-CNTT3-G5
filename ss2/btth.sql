create database bttp_ss02;
use bttp_ss02;

-- customer
create table customers(
 customer_id int auto_increment primary key unique,
 full_name varchar(100) not null,
 phone_number varchar(10) not null unique,
 address varchar(255),
 CCCD varchar(12) not null unique
);

-- acc
create table accounts(
	acc_id int auto_increment primary key unique,
    email varchar(50) unique,
    password varchar(255),
    status enum('active','inactive' ),
    balance decimal(10,2) check(balance>0),
    customer_id int,
    foreign key (customer_id) references customers(customer_id)
);
-- partner
create table partner(
	partner_id int auto_increment primary key unique ,
    full_name varchar(50) not null,
    email varchar(100) not null unique,
    password varchar(255) not null ,
    phone_number varchar(10) not null unique,
    address varchar(255)
);
-- bill

/*
current_timestamp de lấy ngày hiện tại
*/
create table bill(
	bill_id int auto_increment primary key unique ,
    acc_id int,
    total decimal(10,2),
    bill_date datetime default current_timestamp,
    status enum('pending','confirm', 'done', 'failed'),
    foreign key (acc_id) references accounts(acc_id)
);
-- trấnctions
tranctionscreate table tranctions(accounts
	Transaction_id int auto_increment primary key unique ,
    amount decimal(10,2) check(amount>0),
    Transaction_date datetime default current_timestamp,
     acc_id int,
    foreign key (acc_id) references accounts(acc_id)
);