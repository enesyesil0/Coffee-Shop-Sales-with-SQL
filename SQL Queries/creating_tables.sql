-- Creating Tables 

CREATE TABLE shift(
	shift_id varchar(20) primary key,
	day_of_week varchar(10),
	start_time time,
	end_time time)
		
CREATE TABLE address(
	address_id int primary key,
	delivery_address1 varchar(200),
	delivery_address2 varchar(200) NULL,
	delivery_city varchar(50),
	delivery_zipcode varchar(20))
	
CREATE TABLE customers(
	cust_id int primary key,
	cust_firstname varchar(50),
	cust_lastname varchar(50))
	
CREATE TABLE item(
	item_id varchar(10) primary key,
	item_name varchar(50),
	item_cat varchar(50),
	item_price decimal(5,2))
	
CREATE TABLE orders(
	row_id int primary key,
	order_id varchar(10),
	item_id varchar(10) REFERENCES item(item_id),
	created_at datetime REFERENCES rota(date),
	quantity int,
	cust_id int REFERENCES customers(cust_id),
	delivery boolean NOT NULL DEFAULT 0,
	address_id int REFERENCES address(address_id))
	
CREATE TABLE rota(
	row_id int primary key,
	rota_id int,
	date datetime,
	shift_id varchar(20) REFERENCES shift(shift_id),
	staff_id varchar(20) REFERENCES staff(staff_id))
	
CREATE TABLE staff(
	staff_id varchar(20) primary key,
	first_name varchar(50),
	last_name varchar(50),
	position varchar(100),
	hourly_rate decimal(5,2))						