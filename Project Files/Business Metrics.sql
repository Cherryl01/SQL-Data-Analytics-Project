/*
Basic Business Metrics
Key Perfomance Indicators for the company
*/
--total revenue
SELECT SUM(sales_amount) AS revenue
FROM gold.fact_sales;

---total orders
SELECT COUNT(DISTINCT order_number) AS total_orders FROM gold.fact_sales;

---TOtal quantity sold
SELECT SUM(quantity) AS total_uits_sold FROM gold.fact_sales;

--Average Order value
SELECT
	SUM(sales_amount) / COUNT(DISTINCT order_number) AS avg_order_value
	FROM gold.fact_sales;