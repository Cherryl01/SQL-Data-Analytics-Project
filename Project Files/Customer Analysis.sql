/*
customer analysis
identify top spending customers
*/
SELECT
	CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
	SUM(f.sales_amount) AS total_spent
FROM gold.fact_sales f
JOIN gold.dim_customers c
	ON f.customer_key = c.customer_key
GROUP BY CONCAT(c.first_name, ' ', c.last_name)
ORDER BY total_spent DESC