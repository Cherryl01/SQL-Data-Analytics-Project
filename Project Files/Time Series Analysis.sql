/*
Time Series Analysis
Analyze the sales trend over time
*/
--monthly revenue
SELECT
	YEAR(order_date) AS year,
	MONTH(order_date) AS month,
	SUM(sales_amount) AS revenue
FROM gold.fact_sales
GROUP BY MONTH(order_date), YEAR(order_date)
ORDER BY year, month;