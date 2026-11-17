SELECT c.region,
	   COALESCE(COUNT(DISTINCT c.customer_id), 0) AS num_customers,
       COUNT(o.order_id) as num_orders
FROM customers c LEFT JOIN orders o ON c.customer_id=o.customer_id
GROUP BY c.region
