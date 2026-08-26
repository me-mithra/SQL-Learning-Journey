--===================================================================================================================
--Question 5: Product Category Performance
--For every product category, display:
--Product category, Number of transactions, Total units sold, Total revenue, Average transaction revenue
--Arrange the highest-revenue category first
--===================================================================================================================

SELECT product_category, COUNT(transaction_id) AS num_of_transactions,
       SUM(units_sold) AS total_units_sold,
       SUM(total_revenue) AS total_revenue,
       ROUND(AVG(total_revenue),2) AS average_revenue
FROM online_sales
GROUP BY product_category
ORDER BY total_revenue DESC;

--===================================================================================================

-- Concepts Covered
-- GROUP BY   -> Groups rows based on product category
-- COUNT()    -> Counts the number of transactions in each category
-- SUM()      -> Calculates total units sold and total revenue
-- AVG()      -> Calculates the average transaction revenue
-- ROUND()    -> Rounds the average to two decimal places
-- ORDER BY   -> Sorts categories by total revenue from highest to lowest

--====================================================================================================
