SELECT o.order_id,
	   c.name,
       o.amount
FROM orders o JOIN customers c on o.customer_id=c.customer_id
WHERE o.amount > (SELECT AVG(o.amount) FROM orders o)
ORDER BY o.amount DESC