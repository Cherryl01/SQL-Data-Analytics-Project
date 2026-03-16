/*
product perfomance analysis
identifying the top perfoming products
*/
SELECT
	p.product_name,
	SUM(f.sales_amount)AS revenue,
	SUM(f.quantity) AS units_sold
FROM gold.fact_sales f
JOIN gold.dim_products p
	ON f.product_key = p.product_key
GROUP BY p.product_name
ORDER BY revenue DESC;