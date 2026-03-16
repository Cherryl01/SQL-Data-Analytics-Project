/*
Product perfomance
Identify the top products
*/
SELECT
	p.product_name,
	SUM(f.sales_amount) AS revenue,
	RANK() OVER(
		ORDER BY SUM(f.sales_amount) DESC
		) AS product_rank
	FROM gold.fact_sales f
	JOIN gold.dim_products p
			ON f.product_key = p.product_key
	GROUP BY p.product_name;