-- ====================================================================================
-- Database : sql_learning (pgAdmin)
-- Dataset  : Retail Sales Dataset (Kaggle)
--  https://www.kaggle.com/datasets/mohammadtalib786/retail-sales-dataset 
-- ====================================================================================

--==========================================================================================================
--1. Window Function
--Suppose we want to rank transactions from highest to lowest amount , With GROUP BY, rows are combined
--With a window function, every transaction stays visible and receives an additional calculated value
--==========================================================================================================

--The OVER() part tells PostgreSQL that we are using a window function

SELECT
    transaction_id,
    product_category,
    total_amount,
    RANK() OVER (
      ORDER BY total_amount DESC
    ) AS sale_rank
FROM retail_sales;

--============================================================
--2. ROW_NUMBER()
--ROW_NUMBER() gives every row a unique sequential number
--============================================================

--Even when two transactions have the same amount, they receive different row numbers

SELECT
    transaction_id,
    total_amount,
    ROW_NUMBER() OVER (
        ORDER BY total_amount DESC
    ) AS row_number
FROM retail_sales;

--========================================================================
--3. RANK()
--RANK() gives the same rank to equal values, but it skips the next rank
--========================================================================

--Example
--Amount    Rank
--2000      1
--2000      1
--1500      3
--___________________________________________________________________________

SELECT
    transaction_id,
    total_amount,
    RANK() OVER (
        ORDER BY total_amount DESC
    ) AS sale_rank
FROM retail_sales;

--===================================================================================
--4. DENSE_RANK()
--DENSE_RANK() also gives the same rank to equal values, but it does not skip ranks
--===================================================================================

--Example
--Amount    Dense Rank
--2000      1
--2000      1
--1500      2
--_____________________________________________________________________________________

SELECT
    transaction_id,
    total_amount,
    DENSE_RANK() OVER (
        ORDER BY total_amount DESC
    ) AS sale_rank
FROM retail_sales;

--================================================================================
--ROW_NUMBER()  → Always unique numbers
--RANK()        → Same rank, with gaps
--DENSE_RANK()  → Same rank, without gaps
--================================================================================

--================================================================================
--5. PARTITION BY
--PARTITION BY restarts the calculation for every group
--================================================================================

--Rank transactions separately within each product category
--The ranking starts again from 1 for Beauty, Clothing and Electronics

SELECT
    transaction_id,
    product_category,
    total_amount,
    DENSE_RANK() OVER (
        PARTITION BY product_category
        ORDER BY total_amount DESC
    ) AS category_rank
FROM retail_sales;

--  Finding the Highest Sale in Every Category

--To keep only the highest sale, place it inside a subquery
SELECT
    transaction_id,
    product_category,
    total_amount
FROM (
    SELECT
        transaction_id,
        product_category,
        total_amount,
        DENSE_RANK() OVER (
            PARTITION BY product_category
            ORDER BY total_amount DESC
        ) AS category_rank
    FROM retail_sales
) ranked_sales
WHERE category_rank = 1;

--==============================================================================
--6. LAG()
--LAG() allows us to access value from the previous row
--==============================================================================

SELECT
    transaction_id,
    sale_date,
    total_amount,
    LAG(total_amount) OVER (
        ORDER BY sale_date, transaction_id
    ) AS previous_amount
FROM retail_sales;

--To calculate the difference
--The first row returns NULL because it has no previous row

SELECT
    transaction_id,
    sale_date,
    total_amount,
    total_amount -
    LAG(total_amount) OVER (
        ORDER BY sale_date, transaction_id
    ) AS amount_difference
FROM retail_sales;


