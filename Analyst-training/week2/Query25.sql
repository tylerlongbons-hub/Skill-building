SELECT c.name,
	   o.order_date,
       o.amount,
       SUM(o.amount) OVER (PARTITION BY c.customer_ID ORDER BY o.order_date) as running_total
FROM customers c JOIN orders o ON c.customer_id=o.customer_id
ORDER BY c.customer_id, o.order_date
