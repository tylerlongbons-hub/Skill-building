SELECT COUNT(*),
		SUM(o.amount)
FROM orders o JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_date > '2026-07-01'
