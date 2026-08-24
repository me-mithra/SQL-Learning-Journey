--=========================================================================================================================================================
--Question 4: Overall Sales Summary
--Display -> Total transactions, Total units sold, Total revenue,Average transaction revenue, Lowest transaction revenue, Highest transaction revenue.
--Round the average to two decimal places
--=========================================================================================================================================================

SELECT COUNT(transaction_id) AS total_transactions,
SUM(units_sold) AS total_units_sold,
SUM(total_revenue) AS Total_Revenue,
ROUND(AVG(total_revenue),2) AS average_transaction_revenue,
MIN(total_revenue) AS lowest_transaction_revenue,
MAX(total_revenue) AS highest_transaction_revenue
FROM online_sales;

--===================================================================
-- Concepts Covered
-- COUNT() -> Returns the count of rows
-- SUM()   -> Returns the sum of values
-- AVG()   -> Returns the average of values
-- MIN()   -> Returns the minimum value
-- MAX()   -> Returns the maximum value
-- ROUND() -> Rounds the result to the specified decimal places
--===================================================================
