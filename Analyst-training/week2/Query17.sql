SELECT c.name,
	   SUM(o.amount) as total_revenue,
       ROUND(SUM(o.amount) / (SELECT SUM(amount) FROM orders) * 100, 1) as revenue_percent
FROM customers c JOIN orders o ON c.customer_id=o.customer_id
GROUP BY c.customer_id
ORDER BY revenue_percent DESC