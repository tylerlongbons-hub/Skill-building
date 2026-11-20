# Every table(ORDER) with customer name, amount, cust total spend, order by month
SELECT o.order_id,
	   c.name, # Customer Name
	   o.amount, # Order amount
       SUM(o.amount) OVER (PARTITION BY c.customer_id) as total_spend, #Cust total spend
       ROUND(o.amount/SUM(o.amount) OVER (PARTITION BY c.customer_id) * 100, 1) as percent_of_total
FROM orders o JOIN customers c on o.customer_id=c.customer_id
ORDER BY c.name