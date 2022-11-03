create table customer_info (
	id INTEGER not null AUTO_INCREMENT PRIMARY KEY,
	name varchar(255),
	birthday varchar(255),
	gender varchar(255),
	blood varchar(255),
	mailaddress varchar(255),
	tel varchar(255),
	mobile varchar(255),
	post varchar(255),
	address varchar(255),
	company varchar(255),
	card varchar(255),
	myno varchar(255) unique
) ENGINE=InnoDB;