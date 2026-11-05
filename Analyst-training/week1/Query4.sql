SELECT c.region,
	   COUNT(*) AS order_count,
	   SUM(o.amount) as total_revenue
FROM customers c JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.region
HAVING SUM(o.amount) > 300
ORDER BY total_revenue DESC