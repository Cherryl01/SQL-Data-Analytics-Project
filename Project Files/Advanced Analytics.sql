/*
window functions
advanced analytics calculations
*/
---running revenue total
SELECT
	order_date,
	SUM(sales_amount) AS daily_sales,
	SUM(SUM(sales_amount)) OVER (ORDER BY order_date) AS Running_total
FROM gold.fact_sales
GROUP BY order_date
ORDER BY order_date;