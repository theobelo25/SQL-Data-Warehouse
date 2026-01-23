/*
===============================================================================
Date Range Exploration 
===============================================================================
Purpose:
    - To determine the temporal boundaries of key data points.
    - To understand the range of historical data.

SQL Functions Used:
    - MIN(), MAX(), DATEDIFF()
===============================================================================
*/

-- Explore the range of dates available on the gold.fact_sales Table
SELECT
	MIN(order_date) AS first_order_date,
	MAX(order_date) AS last_order_date,
	DATEDIFF(year, MIN(order_date), MAX(order_date)) AS order_range_years
FROM gold.fact_sales;

-- Find the youngest and the oldest customer
SELECT
	MIN(birthdate) AS oldest_birthdate,
	DATEDIFF(year, MIN(birthdate), GETDATE()) AS oldest_age,
	MAX(birthdate) AS youngest_birthdate,
	DATEDIFF(year, MAX(birthdate), GETDATE()) AS youngest_age
FROM gold.dim_customers;

-- Find the longest and shortest running product
SELECT
	MIN(product_start_date) AS oldest_product_start,
	DATEDIFF(year, MIN(product_start_date), GETDATE()) AS longest_time_running_years,
	MAX(product_start_date) AS newest_product_start,
	DATEDIFF(year, MAX(product_start_date), GETDATE()) AS shortest_time_running_years
FROM gold.dim_products;