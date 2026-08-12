
-- ================================================================================================================
-- Database : sql_learning (pgAdmin)
-- Dataset  : Retail Sales Dataset (https://www.kaggle.com/datasets/mohammadtalib786/retail-sales-dataset)
-- =================================================================================================================

--===========================================================================
--1. CTE (Common Table Expression)
--A CTE is a temporary named result that can be used inside the main query 
--It begins with WITH
--===========================================================================

--Here, high_value_sales behaves like a temporary table
--It exists only while this query is running


WITH high_value_sales AS (
    SELECT *
    FROM retail_sales
    WHERE total_amount >= 1000
)
SELECT *
FROM high_value_sales;

--=================================================================================
--2. Why Use a CTE?
--Without a CTE, a complex query may become difficult to read
--=================================================================================

-- Step 1 → Prepare the data
-- Step 2 → Perform the final calculation

--=================================================================================
--3. CTE with Aggregation
--=================================================================================

--Calculate category revenue first
--Then display categories with revenue above 100000

WITH category_revenue AS (
    SELECT
        product_category,
        SUM(total_amount) AS total_revenue
    FROM retail_sales
    GROUP BY product_category
)
SELECT
    product_category,
    total_revenue
FROM category_revenue
WHERE total_revenue > 100000
ORDER BY total_revenue DESC;

--==================================================
--4. Multiple CTEs
--We can create more than one CTE

WITH category_sales AS (             
    SELECT
        product_category,
        COUNT(*) AS transaction_count,
        SUM(total_amount) AS total_revenue
    FROM retail_sales
    GROUP BY product_category
),
overall_sales AS (
    SELECT
        SUM(total_amount) AS overall_revenue
    FROM retail_sales
)
SELECT
    c.product_category,
    c.transaction_count,
    c.total_revenue,
    ROUND(
        c.total_revenue * 100.0 /
        NULLIF(o.overall_revenue, 0),
        2
    ) AS revenue_percentage
FROM category_sales c
CROSS JOIN overall_sales o
ORDER BY revenue_percentage DESC;

--The first CTE calculates category totals
-- The second CTE calculates the complete revenue
--The final query combines both results

--===========================================================
--5. CTE with a Window Function
--===========================================================

--Retrieving the highest transaction in each product category

WITH ranked_sales AS (
    SELECT
        transaction_id,
        customer_id,
        product_category,
        total_amount,
        DENSE_RANK() OVER (
            PARTITION BY product_category
            ORDER BY total_amount DESC
        ) AS category_rank
    FROM retail_sales
)
SELECT
    transaction_id,
    customer_id,
    product_category,
    total_amount
FROM ranked_sales
WHERE category_rank = 1;

--===================================================================
--CTE vs Subquery                                                                              
--Both can be used to create an intermediate result
--===================================================================

--Subquery

SELECT *
FROM (
    SELECT *
    FROM retail_sales
    WHERE total_amount >= 1000
) high_value_sales;

--CTE

WITH high_value_sales AS (
    SELECT *
    FROM retail_sales
    WHERE total_amount >= 1000
)
SELECT *
FROM high_value_sales;

--______________________________________________________________________




