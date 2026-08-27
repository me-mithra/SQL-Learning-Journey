--==================================================================================
--Question 7: Classify Transactions
--Create a new calculated column called revenue_category
--Use these conditions:
--High Value   → total_revenue is 1000 or more
--Medium Value → total_revenue is 500 to below 1000
--Low Value    → total_revenue is below 500
--Display: Transaction ID, Product name, Total revenue, Revenue category
--Arrange the highest revenue first
--==================================================================================

SELECT transaction_id,
       product_name,
       total_revenue,
CASE WHEN total_revenue >= 1000 THEN 'High Value'
     WHEN total_revenue >= 500 THEN 'Medium Value'
     ELSE 'Low Value'
     END AS Revenue_Category
FROM online_sales
ORDER BY total_revenue DESC;

--======================================================
-- Concepts Covered
-- CASE WHEN -> Creates categories based on conditions
-- Alias     -> Gives a name to the calculated column
-- ORDER BY  -> Sorts transactions by revenue
--======================================================
