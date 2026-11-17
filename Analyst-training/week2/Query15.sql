SELECT c.region,
	   COUNT(DISTINCT c.customer_id) AS num_customers,
       COUNT(DISTINCT o.customer_id) as customers_with_orders
FROM customers c LEFT JOIN orders o ON c.customer_id=o.customer_id
GROUP BY c.region
