--=======================================================================
--Question 3: Find Unique Values
--Write three separate queries to display:
--Unique product categories , Unique regions , Unique payment methods
--Sort every result alphabetically
--=======================================================================

SELECT DISTINCT product_category 
FROM online_sales
ORDER BY product_category;
--===================================
SELECT DISTINCT region 
FROM online_sales
ORDER BY region;
--===================================
SELECT DISTINCT payment_method
FROM online_sales 
ORDER BY payment_method;
--===================================

--=========================================================
--Concepts Covered
--Distinct -> Return unique row,eliminates the duplicates
--Order By -> Sort the rows
--=========================================================
