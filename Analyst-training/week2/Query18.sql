SELECT c.region,
       COUNT(*) as num_orders,
       COUNT(DISTINCT c.customer_id) as num_unique_cust,
       COUNT(*) / COUNT(DISTINCT c.customer_id) as orders_per_customer
FROM customers c JOIN orders o ON c.customer_id=o.customer_id
GROUP BY c.region