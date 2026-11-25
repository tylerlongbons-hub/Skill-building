# Region
# total spend
# percent share of all spend rounded to 1 decimal
SELECT c.region,
	   SUM(CASE WHEN o.amount >= 0 THEN o.amount ELSE 0 END) AS total_region_spend,
       ROUND(SUM(CASE WHEN o.amount >= 0 THEN o.amount ELSE 0 END) / (SUM(SUM(o.amount)) OVER ()) * 100, 1) AS total_spend_perc
FROM customers c LEFT JOIN orders o ON c.customer_id=o.customer_id
GROUP BY c.region