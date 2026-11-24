SELECT c.region,
       COUNT(CASE WHEN o.amount >= 300 THEN 1 END) AS num_orders_over_300,
       COUNT(CASE WHEN o.amount < 300 THEN 1 END) AS num_orders_under_300
FROM customers c LEFT JOIN orders o ON c.customer_id=o.customer_id
GROUP BY c.region