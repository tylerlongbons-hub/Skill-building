# Region
# total spend
# percent share of all spend rounded to 1 decimal
SELECT c.region,
	   COALESCE(SUM(o.amount), 0) AS total_region_spend,
       ROUND(COALESCE(SUM(o.amount), 0) / (SUM(SUM(o.amount)) OVER ()) * 100, 1) AS total_spend_perc
FROM customers c LEFT JOIN orders o ON c.customer_id=o.customer_id
GROUP BY c.region