SELECT c.region,
	  COUNT(*) as count,
      SUM(o.amount) as total_amount,
      AVG(o.amount) as average_order_amount
FROM orders o JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.region
HAVING COUNT(*) >= 2
ORDER BY AVG(o.amount) DESC