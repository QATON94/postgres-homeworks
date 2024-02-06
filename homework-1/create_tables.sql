-- SQL-команды для создания таблиц
CREATE TABLE customers_data
(
	customer_id varchar(5) NOT NULL,
	company_name varchar(100) NOT NULL,
	contact_name varchar(100) NOT NULL
);

CREATE TABLE employees_data
(
	employee_id int PRIMARY KEY,
	first_name varchar(100) NOT NULL,
	last_name varchar(100) NOT NULL,
	title varchar(100) NOT NULL,
	birth_date date NOT NULL,
	notes text
);

CREATE TABLE orders_data
(
	order_id int PRIMARY KEY,
	customers_id varchar(5) UNIQUE REFERENCES customers_data(customer_id),
	employees_id int UNIQUE REFERENCES employees_data(employee_id),
	order_date date,
	ship_city varchar(100) NOT NULL
);