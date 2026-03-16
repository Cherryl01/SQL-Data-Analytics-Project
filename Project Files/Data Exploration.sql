/*Data Exploration
Understand the structure and size of our data
*/
---Preview the sales data
SELECT TOP 10 * FROM gold.fact_sales;

--Count records in each table
SELECT COUNT(*) AS total_sales FROM gold.fact_sales;

SELECT COUNT(*) AS total_sales FROM gold.dim_products;

SELECT COUNT(*) AS total_sales FROM gold.dim_customers;

---check the date range of the dataset
SELECT
	MIN(order_date) AS first_order,
	MAX(order_date) AS last_order
FROM gold fact_sales;