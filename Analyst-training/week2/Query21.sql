SELECT c.name
FROM customers c LEFT JOIN orders o ON c.customer_id=o.customer_id
	AND o.order_date >= '2026-08-01'
WHERE o.order_id IS NULL 