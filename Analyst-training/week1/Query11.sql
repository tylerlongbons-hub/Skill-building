SELECT DATE_FORMAT(order_date, '%Y-%m') as month_year,
       SUM(amount) as revenue
FROM orders
GROUP BY month_year
HAVING SUM(amount) > 100
ORDER BY month_year ASC
