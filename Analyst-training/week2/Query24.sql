SELECT c.name,
       SUM(CASE WHEN o.order_date < '2026-07-01' THEN o.amount ELSE 0 END) AS spend_before_2026_07_01,
       SUM(CASE WHEN o.order_date >= '2026-07-01' THEN o.amount ELSE 0 END) AS spend_after_2026_07_01
FROM customers c LEFT JOIN orders o ON c.customer_id=o.customer_id
GROUP BY c.name