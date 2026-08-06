-- =======================================================================================
-- Day 03 - Aggregate Functions
--Aggregate functions take several rows and return one summarized result
-- Database : sql_learning (PostgreSQL)
-- Dataset  : https://www.kaggle.com/datasets/mohammadtalib786/retail-sales-dataset
-- =======================================================================================

--=================================
-- 1.COUNT()
-- COUNT() counts records.
--=================================

SELECT COUNT(*) AS total_sales
FROM retail_sales;

--To count customers:

SELECT COUNT(customer_id) AS customer_count
FROM retail_sales;

--To count only unique customers:

SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales;

--=============================
-- 2.SUM()
--SUM() adds numeric values
--=============================

-- Retrieve total revenue generated from all transactions.

SELECT SUM(total_amount) AS total_revenue
FROM retail_sales;

--================================
-- 3.AVG()
--AVG() calculates the average.
--================================


SELECT AVG(total_amount) AS average_sale
FROM retail_sales;

--For a cleaner result, use ROUND()

SELECT ROUND(AVG(total_amount), 2) AS average_sale
FROM retail_sales;

--========================================
-- 4.MIN()
-- MIN() returns the lowest value.
--========================================

SELECT MIN(total_amount) AS lowest_sale
FROM retail_sales;

--=======================================
-- 5.MAX()
--MAX() returns the highest value.
--=======================================

SELECT MAX(total_amount) AS highest_sale
FROM retail_sales;

--====================================
--Using aggregate functions together
--====================================

SELECT
    COUNT(*) AS total_transactions,
    SUM(total_amount) AS total_revenue,
    ROUND(AVG(total_amount), 2) AS average_sale,
    MIN(total_amount) AS lowest_sale,
    MAX(total_amount) AS highest_sale
FROM retail_sales;

--======================================
-- 6.GROUP BY
--======================================

-- To retrieve total revenue for each product category
-- Group by =  groups all rows belonging to the same category and calculates the total for each group.
SELECT
    product_category,
    SUM(total_amount) AS total_revenue
FROM retail_sales
GROUP BY product_category;

--Count Sales by Category

SELECT
    product_category,
    COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY product_category;

--Average Sale by Gender

SELECT
    gender,
    ROUND(AVG(total_amount), 2) AS average_sale
FROM retail_sales
GROUP BY gender;

--====================================================
-- Grouping by Multiple Columns
--====================================================

-- This creates a separate group for every category and gender combination.

SELECT
    product_category,
    gender,
    COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY product_category, gender;

--==========================================
--WHERE with GROUP BY
--WHERE filters individual rows before grouping happens.
--==========================================

-- To retrieve category-wise revenue only for customers aged 30 or above

SELECT
    product_category,
    SUM(total_amount) AS total_revenue
FROM retail_sales
WHERE age >= 30
GROUP BY product_category;


--==========================
--Order of writing:
--SELECT
--FROM
--WHERE
--GROUP BY
--ORDER BY
--==========================

--==================================
-- 7.HAVING
--HAVING filters grouped results
--==================================

-- To retrieve categories with more than 300 transactions

SELECT
    product_category,
    COUNT(*) AS total_transactions
FROM retail_sales
GROUP BY product_category
HAVING COUNT(*) > 300;

--========================================
--WHERE vs HAVING
--WHERE  → filters rows before grouping
--HAVING → filters groups after grouping
--========================================

SELECT
    product_category,
    SUM(total_amount) AS total_revenue
FROM retail_sales
WHERE age >= 25                     -- WHERE removes customers below 25
GROUP BY product_category           -- GROUP BY creates category groups
HAVING SUM(total_amount) > 100000;  --HAVING keeps categories whose revenue is above 100000

--=========================================
-- 8.Sorting Aggregated Results
--=========================================

-- To retrieve category with the highest revenue

SELECT
    product_category,
    SUM(total_amount) AS total_revenue
FROM retail_sales
GROUP BY product_category
ORDER BY total_revenue DESC;

-- To retrieve category with the highest average transaction amount

SELECT
    product_category,
    ROUND(AVG(total_amount), 2) AS average_sale
FROM retail_sales
GROUP BY product_category
ORDER BY average_sale DESC;

--========================================================================================================
-- Question : categories that generated more than 100000 in revenue from customers aged between 20 and 50:
--========================================================================================================

SELECT
    product_category,
    COUNT(*) AS total_transactions,
    SUM(total_amount) AS total_revenue,
    ROUND(AVG(total_amount), 2) AS average_sale
FROM retail_sales
WHERE age BETWEEN 20 AND 50
GROUP BY product_category
HAVING SUM(total_amount) > 100000
ORDER BY total_revenue DESC;
