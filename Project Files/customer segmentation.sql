/*
Customer segmentation
Categorize customers by spending
*/
SELECT
	CONCAT(c.first_name, ' ', c.last_name) AS fullname,
	SUM(f.sales_amount) AS total_spent,

	CASE
		WHEN SUM (f.sales_amount) > 5000
					THEN 'VIP'
		WHEN SUM (f.sales_amount) > 2000
					THEN 'Regular'
		ELSE 'Low Value'
	END AS customer_segment
		FROM gold.fact_sales f
		JOIN gold.dim_customers c ON f.customer_key = c.customer_key
		GROUP BY CONCAT(c.First_name, ' ', c.Last_name)
		ORDER BY total_spent DESC;