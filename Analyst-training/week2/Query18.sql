SELECT c.region,
       COUNT(*) as num_orders,
       COUNT(DISTINCT c.customer_id) as num_unique_cust,
       SUM(o.amount) / COUNT(DISTINCT c.customer_id) as average_order
FROM customers c JOIN orders o ON c.customer_id=o.customer_id
GROUP BY c.region