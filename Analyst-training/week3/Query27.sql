# Total amount for each category
# income statement order: Revenue, COGS, OpEx, Interest, Tax
SELECT category, 
	   SUM(amount) AS total_amount
FROM gl_entries
GROUP BY category
ORDER BY CASE category WHEN "Revenue" THEN 1
					   WHEN "COGS" THEN 2
                       WHEN "OpEx" THEN 3
                       WHEN "Interest" THEN 4
                       ELSE 5 END
