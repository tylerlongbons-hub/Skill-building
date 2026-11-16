SELECT c.name, 
	   c.region, 
       COUNT(o.order_id) as order_count,
       COALESCE(SUM(o.amount), 0) as total_spent
FROM customers c LEFT JOIN orders o ON c.customer_id=o.customer_id
GROUP BY c.customer_id