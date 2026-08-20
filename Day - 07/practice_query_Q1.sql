--====================================================================================================================================================================================================
--Steps to be follow to create table in pgadmin

--1.Download the dataset from Kaggle and Extract the File 
--2.Create the PostgreSQL Database : Open pgAdmin, Go to Servers → PostgreSQL → Databases: Right-click Databases and select:Create → Database Enter the database name: onlinesalesassessment → Save
--3.Create the Table :  Right-click the database and select Query Tool -> Run the following query
CREATE TABLE online_sales (
    transaction_id INT PRIMARY KEY,
    sale_date DATE,
    product_category VARCHAR(100),
    product_name VARCHAR(200),
    units_sold INT,
    unit_price NUMERIC(12,2),
    total_revenue NUMERIC(14,2),
    region VARCHAR(50),
    payment_method VARCHAR(50)
);
--After running the query, refresh the Tables section
--4.Import the CSV File 
--In pgAdmin, open:onlinesalesassessment → Schemas → public → Tables -> Right-click the online_sales table -> Import/Export Data -> Import -> Select the downloaded CSV 
-- Use these settings: ->Format: CSV, Header: Yes, Encoding: UTF8, Delimiter: ,. -> click Ok.
--5.Verify the Imported Data
--Run:
SELECT *
FROM online_sales
LIMIT 10;

-- Ready to practice 
--====================================================================================================================================================================================================


--============================================================================
--Question 1: Display the First 10 Transactions
--Display:
--Transaction ID
--Sale date
--Product name
--Total revenue
--Sort the results by transaction ID in ascending order and show only 10 rows
--=============================================================================

SELECT transaction_id, sale_date, product_name, total_revenue
From online_sales
ORDER BY transaction_id
LIMIT 10;

-- ============================================================
-- Concepts Covered
-- SELECT    -> Retrieve required columns
-- ORDER BY  -> Sort transactions by transaction_id
-- LIMIT     -> Display only the first 10 rows
-- ============================================================
