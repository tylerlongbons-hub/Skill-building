SELECT c.name,
	   SUM(o.amount) AS total_spend,
	   RANK() OVER (ORDER BY SUM(o.amount) DESC)
FROM customers c JOIN orders o on c.customer_id=o.customer_id
GROUP BY c.name