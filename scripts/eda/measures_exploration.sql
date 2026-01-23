/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.

SQL Functions Used:
    - COUNT(), SUM(), AVG()
===============================================================================
*/

-- Find the Total Sales
SELECT SUM(sales_amount) AS total_sales
FROM gold.fact_sales;

-- Find the Total number of Items Sold
SELECT SUM(quantity) AS total_quantity_sold
FROM gold.fact_sales;

-- Find the Average Selling Price
SELECT AVG(price) AS average_price
FROM gold.fact_sales;

-- Find the Total Number of Orders
SELECT COUNT(order_number) AS total_orders
FROM gold.fact_sales;

SELECT COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales;

-- Find the Total Number of Products
SELECT 
	COUNT(product_name) AS total_products
FROM gold.dim_products

SELECT 
	COUNT(DISTINCT product_name) AS total_products
FROM gold.dim_products

-- Find the Total Number of Customers
SELECT COUNT(customer_key) AS total_customers
FROM gold.dim_customers

-- Find the Total Number of Customers that have Placed an Order
SELECT COUNT(DISTINCT customer_key) AS total_customers_with_order
FROM gold.fact_sales


SELECT 
	'Total Sales' as measure_name,
	SUM(sales_amount) AS measure_value
FROM gold.fact_sales
UNION ALL
SELECT
	'Total Quantity' as measure_name,
	SUM(quantity) AS measure_value
FROM gold.fact_sales
UNION ALL
SELECT
	'Average Price' as measure_name,
	AVG(price) AS measure_value
FROM gold.fact_sales
UNION ALL
SELECT 
	'Total Nr. Orders' as measure_name,
	COUNT(DISTINCT order_number) AS measure_value
FROM gold.fact_sales
UNION ALL
SELECT
	'Total Nr. Products' as measure_name,
	COUNT(product_name) AS measure_value
FROM gold.dim_products
UNION ALL
SELECT
	'Total Nr. Customers' as measure_name,
	COUNT(customer_key) AS measure_value
FROM gold.dim_customers
