SELECT c.name,
	   o.order_id,
       o.amount,
       RANK() OVER (PARTITION BY c.name ORDER BY o.amount DESC)
FROM customers c JOIN orders o ON c.customer_id=o.customer_id