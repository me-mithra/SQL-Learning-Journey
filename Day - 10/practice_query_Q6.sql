--======================================================================
--Question 6: Find High-Revenue Categories
--Find categories whose total revenue is greater than 10000
--Display: Product category, Transaction count, Total revenue
--Arrange the highest revenue first
--=======================================================================

SELECT product_category,
       COUNT(transaction_id) AS transaction_count,
       SUM(total_revenue) AS total_revenue
FROM online_sales
GROUP BY product_category
HAVING SUM(total_revenue)  > 10000
ORDER BY total_revenue DESC;

--========================================================================
-- Concepts Covered
-- GROUP BY   -> Groups transactions based on product category
-- HAVING     -> Filters grouped results based on an aggregate condition
-- COUNT()    -> Counts the number of transactions in each category
-- SUM()      -> Calculates the total revenue for each category
-- ORDER BY   -> Sorts categories by total revenue in descending order
--========================================================================
