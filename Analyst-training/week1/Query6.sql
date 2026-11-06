SELECT c.name, c.customer_id
FROM customers c LEFT JOIN orders o on c.customer_id = o.customer_id
WHERE o.order_id is NULL