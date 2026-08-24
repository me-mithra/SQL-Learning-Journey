--=======================================
--In continuation with Day - 07
--=======================================

--============================================================================
--Question 2: Filter Electronics Sales
--Display Electronics transactions where total revenue is greater than 1000
--Show : Transaction ID , Product name , Units sold , Total revenue
--Arrange the highest revenue first
--============================================================================

SELECT transaction_id , product_name , units_sold , total_revenue
FROM online_sales
WHERE product_category = 'Electronics' AND total_revenue > 1000
ORDER BY total_revenue DESC;

--======================================================================
--Topics Covered
--WHERE -> Filters rows
--AND -> Return rows only if both condition satisfies.
--Order By -> sort the result (here:total_revenue by descending order)
--======================================================================
