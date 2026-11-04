CREATE DATABASE analyst_training; USE analyst_training;
CREATE TABLE customers (customer_id INT PRIMARY KEY, name VARCHAR(50), signup_date DATE, region VARCHAR(20));
CREATE TABLE orders (order_id INT PRIMARY KEY, customer_id INT, order_date DATE, amount DECIMAL(10,2));
INSERT INTO customers VALUES (1,'Ana','2026-01-05','West'),(2,'Ben','2026-02-10','East'),(3,'Cara','2026-03-15','West'),(4,'Dev','2026-04-20','South'),(5,'Eli','2026-05-25','East');
INSERT INTO orders VALUES (101,1,'2026-06-01',250),(102,1,'2026-07-03',400),(103,2,'2026-06-15',90),(104,3,'2026-08-09',700),(105,2,'2026-09-12',120),(106,3,'2026-10-01',55);customers