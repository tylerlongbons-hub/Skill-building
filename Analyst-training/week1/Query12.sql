SELECT c.region,
       SUM(o.amount) as total
FROM customers c JOIN orders o ON c.customer_id=o.customer_id
WHERE c.signup_date < '2026-04-01'
GROUP BY c.region
HAVING total >= 500

