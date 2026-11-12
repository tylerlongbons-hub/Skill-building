SELECT 
	c.customer_id, 
    c.name,
    COUNT(*) as order_count,
    AVG(o.amount) as avg_order_amount
FROM customers c JOIN Orders o on c.customer_id = o.customer_id
GROUP BY c.customer_id
HAVING AVG(o.amount) > 150
ORDER BY avg_order_amount DESC