# One Row per Month
# Needs Revenue, COGS, gross profit, gross margin % rounded to 1 decimal
SELECT DATE_FORMAT(entry_month, '%Y-%m') as Month,
	   SUM(CASE WHEN category = "Revenue" THEN amount ELSE 0 END) AS revenue,
       SUM(CASE WHEN category = "COGS" THEN amount ELSE 0 END) as COGS,
       SUM(CASE WHEN category = "Revenue" THEN amount ELSE 0 END) - SUM(CASE WHEN category = "COGS" THEN amount ELSE 0 END) AS gross_profit,
       ROUND((SUM(CASE WHEN category = "Revenue" THEN amount ELSE 0 END) - SUM(CASE WHEN category = "COGS" THEN amount ELSE 0 END)) / SUM(CASE WHEN category = "Revenue" THEN amount ELSE 0 END) * 100, 1) AS gross_margin
FROM gl_entries
GROUP BY DATE_FORMAT(entry_month, '%Y-%m')
ORDER BY DATE_FORMAT(entry_month, '%Y-%m')