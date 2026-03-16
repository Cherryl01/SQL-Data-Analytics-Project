---Top 5 Customers
SELECT
	CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
	SUM(f.sales_amount) AS revenue
FROM gold.fact_sales f
JOIN gold.dim_customers c
	ON f.customer_key = c.customer_key
GROUP BY CONCAT(c.first_name, ' ', c.last_name)
ORDER BY revenue DESC;

---Top products per country
SELECT * FROM(
	SELECT 
		c.country,
		p.product_name,
		SUM(f.sales_amount) AS revenue,

		RANK () OVER (
			PARTITION BY c.country
			ORDER BY SUM(f.sales_amount) DESC
			) AS rnk
	FROM gold.fact_sales f
	JOIN gold.dim_customers c
			ON f.customer_key = c.customer_key
	JOIN gold.dim_PRODUCTS P
			ON f.product_key = p.product_key
	GROUP BY c.country, p.product_name
)t
WHERE rnk <= 3;


