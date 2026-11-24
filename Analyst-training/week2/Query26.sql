SELECT c.region,
       COUNT(CASE WHEN o.amount >= 300 THEN 1 END) AS num_large_orders,
       COUNT(CASE WHEN o.amount < 100 THEN 1 END) AS num_small_orders
FROM customers c LEFT JOIN orders o ON c.customer_id=o.customer_id
GROUP BY c.region