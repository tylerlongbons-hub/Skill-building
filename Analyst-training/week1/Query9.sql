SELECT COUNT(*),
	   SUM(amount)
FROM orders o 
WHERE order_date >= '2026-07-01'
