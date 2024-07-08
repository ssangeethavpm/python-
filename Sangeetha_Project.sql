CREATE DATABASE PROJECT;
USE PROJECT;
-- CUSTOMERS TABLE
CREATE TABLE customers
(customer_id INT NOT NULL PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
phone VARCHAR(20),
email VARCHAR(30),
CITY VARCHAR(30),
STATE VARCHAR(30),
POST_CODE VARCHAR(30));
INSERT INTO customers VALUES
(1,'robert','martinez','989898128','robert@gmail.com','duckles','Birmingham','b24 4ra'),
(2,'robert','martinez','989898128','robert@gmail.com','duckles','Birmingham','b24 4ra'),
(3,'david','gracia','989891218','davids@gmail.com','aston','Birmingham','b24 4ra'),
(4,'Mary','Jhonson','77723989898','mary@gmail.com','gospal','london','l24 4ra');
SELECT * FROM customers;
-- ORDERS
CREATE TABLE orders
(order_id INT NOT NULL PRIMARY KEY,
customer_id INT,
order_status VARCHAR(50),
order_date date,
shipped_date date,
store_id INT,
staff_id INT,
CONSTRAINT fk_customer_id FOREIGN KEY(customer_id) REFERENCES customers(customer_id));

INSERT INTO orders VALUES
(1,1,'NOT DELIVERED','2022-01-23','2022-01-26',100,1000),
(2,1, 'DELIVERED','2022-06-23','2022-06-30',101,2000),
(3,2, 'DELIVERED','2021-01-23','2021-01-26',100,3000),
(4,3, 'DELIVERED','2020-05-05','2020-05-25',100,4000);

SELECT * from orders;
drop table orders;
-- STAFF
CREATE TABLE staff
(staff_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
phone VARCHAR(20),
email VARCHAR(30),
active VARCHAR(10),
store_id INT,
Manager_id INT);

-- stores
CREATE TABLE stores
(store_id INT PRIMARY KEY,
store_name VARCHAR(50),
phone VARCHAR(20),
email VARCHAR(30),
STREET VARCHAR(30),
CITY VARCHAR(30),
STATE VARCHAR(30),
POST_CODE VARCHAR(30));

-- order_items
CREATE TABLE stores
(order_id INT,
item_id INT PRIMARY KEY,
quantity int,
list_price INT,
discount INT,
CONSTRAINT fk_ORDER_id FOREIGN KEY(ORDER_id) REFERENCES orders(order_id));
DROP  TABLE stores;



