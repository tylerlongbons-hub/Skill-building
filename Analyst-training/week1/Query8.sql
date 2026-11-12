SELECT c.name, 
		c.region,
        MAX(o.amount) as max_order_amount
FROM orders o RIGHT JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id