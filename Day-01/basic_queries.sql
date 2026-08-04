============================================
 --Day 01 :  SQL Basics
 --Database : sql_learning (PostgreSQL)
 --Dataset  : Retail Sales Dataset (Kaggle)
 ============================================

============================================
--Created Table inside the database 'sql_learning' in pgAdmin
============================================

CREATE TABLE retail_sales (
    transaction_id INT PRIMARY KEY,
    sale_date DATE,
    customer_id VARCHAR(20),
    gender VARCHAR(10),
    age INT,
    product_category VARCHAR(50),
    quantity INT,
    price_per_unit NUMERIC(10,2),
    total_amount NUMERIC(10,2)
);

====================================================================
--Imported the downloaded CSV dataset into PostgreSQL using pgAdmin.
====================================================================

===========================================
-- 1.SELECT
--SELECT is used to retrieve data from a table.
===========================================
-- * means all columns
 SELECT *
FROM retail_sales;

-- we can also select the column we need by specifying column name in SELECT clause
SELECT transaction_id, customer_id, total_amount
FROM retail_sales;

===========================================
-- 2.WHERE
--WHERE filters the rows based on a condition.
===========================================
-- Find all clothing purchases
SELECT *
FROM retail_sales
WHERE product_category = 'Clothing';

--Find transactions above ₹1,000
SELECT *
FROM retail_sales
WHERE total_amount > 1000;

===========================================
--  3.AND and OR
--Use AND when both conditions must be true.
--Use OR when either condition can be true.
===========================================
  
--This returns electronics transactions worth ₹1,000 or more.
SELECT *
FROM retail_sales
WHERE product_category = 'Electronics'
  AND total_amount >= 1000;

-- This returns transactions of clothing and beauty products.
SELECT *
FROM retail_sales
WHERE product_category = 'Clothing'
   OR product_category = 'Beauty';

==============================================
-- 4.IN
--IN is useful when checking multiple values.
==============================================

--This returns purchases from either category
SELECT *
FROM retail_sales
WHERE product_category IN ('Clothing', 'Beauty');

====================================================
-- 5.BETWEEN
--BETWEEN checks whether a value is within a range.
====================================================

--Find customers between 20 and 30 years old:
SELECT *
FROM retail_sales
WHERE age BETWEEN 20 AND 30;

======================================================
-- 6.DISTINCT
--DISTINCT removes duplicate values.
======================================================

--To see the available product categories:
SELECT DISTINCT product_category
FROM retail_sales;

=======================================================
-- 7.ORDER BY
--ORDER BY sorts the result.
=======================================================

--Display transactions from lowest to highest amount
SELECT transaction_id, total_amount
FROM retail_sales
ORDER BY total_amount ASC;

--Display transactions from highest to lowest amount:
SELECT transaction_id, total_amount
FROM retail_sales
ORDER BY total_amount DESC;

========================================================
-- 8.LIMIT
--LIMIT controls how many records are displayed.
========================================================
--Find the five highest-value transactions:
SELECT transaction_id, customer_id, total_amount
FROM retail_sales
ORDER BY total_amount DESC
LIMIT 5;

===========================================================
-- 9.Working with NULL
--NULL means that a value is missing or unknown.
===========================================================

--To find records where age is missing:
SELECT *
FROM retail_sales
WHERE age IS NULL;

--To find records where age is available:
SELECT *
FROM retail_sales
WHERE age IS NOT NULL;

===============================================================
  
 ============================================
-- End of Day 01
-- Concepts Covered:
-- SELECT
-- WHERE
-- AND
-- OR
-- IN
-- BETWEEN
-- DISTINCT
-- ORDER BY
-- LIMIT
-- IS NULL
===============================================











