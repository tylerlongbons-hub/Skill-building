SELECT 
       CASE
	      WHEN o.amount >= 300 THEN 'Large'
          WHEN o.amount >= 100 THEN 'Medium'
          ELSE "Small"
	   END AS size_label,
       COUNT(*) as num_orders,
       SUM(o.amount) as total
FROM orders o
GROUP BY size_label