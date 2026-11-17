SELECT 
       CASE
	      WHEN o.amount >= 300 THEN 'Large'
          WHEN o.amount >= 100 AND o.amount <= 299 THEN 'Medium'
          WHEN o.amount < 100 THEN 'Small'
          else "Na"
	   END AS size_label,
       COUNT(*) as num_orders,
       SUM(o.amount) as total
FROM orders o LEFT JOIN customers c ON c.customer_id=o.customer_id
GROUP BY size_label