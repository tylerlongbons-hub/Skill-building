SELECT DATE_FORMAT(order_date, '%Y-%m') as month_name,
	   SUM(amount) as monthly_revenue,
       SUM(SUM(amount)) OVER (ORDER BY DATE_FORMAT(order_date, '%Y-%m')) as running_total
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')