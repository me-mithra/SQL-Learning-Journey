--======================================================================
--Problem 1: Recyclable and Low Fat Products
--https://leetcode.com/problems/recyclable-and-low-fat-products/
--======================================================================
  
--Write a solution to find the ids of products that are both low fat and recyclable.

SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';

--==============================================================
--Problem 2: Customer Referee
--https://leetcode.com/problems/find-customer-referee/
--==============================================================
  
-- Retrieve the names of the customer who were not referred by customer ID 2 or not referred by any customer

SELECT name
FROM Customer
WHERE referee_id != 2 OR referee_id is null;

--===============================================================
--Problem 3: Big Countries
--https://leetcode.com/problems/big-countries/description/
--===============================================================
  
-- Retrieve the name, population, and area of the big countries.

SELECT name,population,area
FROM World
WHERE area >= 3000000 OR population >= 25000000;

--================================================================
--Problem 4: Article Views I
--https://leetcode.com/problems/article-views-i/
--================================================================

--Retrieve all the authors that viewed at least one of their own articles.

  SELECT DISTINCT author_id AS id
  FROM Views
  WHERE author_id = viewer_id;
  
--===============================================================
--Problem 5: Invalid Tweets
--https://leetcode.com/problems/invalid-tweets/
--===============================================================

--Retrieve the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15

SELECT tweet_id 
FROM Tweets 
WHERE length(content)>15;

--==========================================================
-- End of Day 01
-- Total Problems Solved : 5
--==========================================================


