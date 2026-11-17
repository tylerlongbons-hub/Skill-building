SELECT o.order_id,
       c.name,
       o.amount,
       CASE
	      WHEN o.amount >= 300 THEN 'Large'
          WHEN o.amount >= 100 THEN 'Medium'
          else "Small"
	   END AS size_label
FROM orders o LEFT JOIN customers c ON c.customer_id=o.customer_id
ORDER BY o.amount DESC