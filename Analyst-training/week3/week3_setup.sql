CREATE TABLE gl_entries (entry_id INT PRIMARY KEY, entry_month DATE, category VARCHAR(20), account VARCHAR(30), amount DECIMAL(10,2));
INSERT INTO gl_entries VALUES
(1,'2026-10-01','Revenue','Product sales',12000),(2,'2026-10-01','Revenue','Services',3000),
(3,'2026-10-01','COGS','Materials',6000),(4,'2026-10-01','OpEx','Salaries',4000),
(5,'2026-10-01','OpEx','Rent',1500),(6,'2026-10-01','OpEx','Marketing',800),
(7,'2026-10-01','Interest','Loan interest',200),(8,'2026-10-01','Tax','Income tax',600),
(9,'2026-11-01','Revenue','Product sales',14000),(10,'2026-11-01','Revenue','Services',2500),
(11,'2026-11-01','COGS','Materials',7200),(12,'2026-11-01','OpEx','Salaries',4000),
(13,'2026-11-01','OpEx','Rent',1500),(14,'2026-11-01','OpEx','Marketing',1500),
(15,'2026-11-01','Interest','Loan interest',200),(16,'2026-11-01','Tax','Income tax',500);