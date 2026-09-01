--===================================================================================================
--Question 10: Top Three Products in Every Category
--Using a CTE and a window function, display the top three products by revenue in each category
--Display: Product category, Product name, Total units sold, Total revenue, Product rank
--Sort by: Product category, Product rank, Total revenue from highest to lowest
--===================================================================================================

WITH top_products AS (
  SELECT product_category,
         product_name,
         SUM(units_sold) AS total_units_sold,
         SUM(total_revenue) AS total_revenue,
         DENSE_RANK()OVER(PARTITION BY product_category
                          ORDER BY SUM(total_revenue) DESC) AS product_rank
  FROM online_sales
  GROUP BY product_name,product_category
)

SELECT * FROM top_products
WHERE product_rank<=3
ORDER BY product_category,product_rank;

--====================================================================
-- Concepts Covered
-- WITH          -> Starts a Common Table Expression
-- CTE           -> Creates a temporary named result set
-- GROUP BY      -> Groups sales by product category and product
-- SUM()         -> Calculates total units sold and total revenue
-- DENSE_RANK()  -> Ranks products based on revenue
-- PARTITION BY  -> Restarts ranking for every product category
-- ORDER BY      -> Controls ranking order and final result display
--====================================================================
