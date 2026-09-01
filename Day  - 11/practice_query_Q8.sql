--=====================================================================================================================
--Question 8: Monthly Sales Report
--Create a monthly report containing
--Month in YYYY-MM format, Number of transactions, Total units sold, Total revenue, Average transaction revenue
--Arrange the earliest month first
--======================================================================================================================

SELECT TO_CHAR(sale_date,'YYYY-MM') AS sale_month,
COUNT(transaction_id) AS num_of_transactions,
SUM(units_sold) AS total_units_sold,
SUM(total_revenue) AS total_revenue,
ROUND(AVG(total_revenue),2) AS average_revenue
FROM online_sales
GROUP BY TO_CHAR(sale_date,'YYYY-MM')
ORDER BY sale_month;

--============================================================================================================
-- Concepts Covered
-- TO_CHAR()  -> Formats the sale date into YYYY-MM format
-- GROUP BY   -> Groups transactions by month
-- COUNT()    -> Counts the number of transactions in each month
-- SUM()      -> Calculates total units sold and total revenue
-- AVG()      -> Calculates the average transaction revenue
-- ROUND()    -> Rounds the average revenue to two decimal places
-- ORDER BY   -> Sorts the monthly report from earliest to latest
--============================================================================================================
