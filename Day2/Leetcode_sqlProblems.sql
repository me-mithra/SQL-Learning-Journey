/*
Day 02 Summary

Problems Solved : 5

Concepts Used
-------------
- INNER JOIN
- LEFT JOIN
- GROUP BY
- COUNT()
- AVG()
- ROUND()
- LAG()
*/



--================================================================================================
-- 1. Replace Employee ID With The Unique Identifier  
-- https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/
--================================================================================================

SELECT eu.unique_id,
       e.name
FROM Employees e LEFT JOIN EmployeeUNI eu 
ON e.id = eu.id;

--================================================================================================
-- 2. Product Sales Analysis I   
-- https://leetcode.com/problems/product-sales-analysis-i/
--================================================================================================

SELECT p.product_name,
       s.year,s.price
FROM Sales s JOIN Product p
ON s.product_id = p.product_id;

--================================================================================================
-- 3. Customer Who Visited but Did Not Make Any Transactions   
-- https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/
--================================================================================================

SELECT v.customer_id , 
       COUNT(*) AS count_no_trans
FROM Visits v  LEFT JOIN Transactions t
ON v.visit_id = t.visit_id
where t.transaction_id is null
GROUP BY v.customer_id;

--================================================================================================
-- 4. Rising Temperature  
-- https://leetcode.com/problems/rising-temperature/
--================================================================================================

SELECT id FROM (
    SELECT id,temperature,
    LAG(temperature) OVER(ORDER BY recordDate) as previous_temp 
    FROM Weather) 
    WHERE temperature > previous_temp;

--================================================================================================
-- 5. Average Time of Process per Machine 
-- https://leetcode.com/problems/average-time-of-process-per-machine/
--================================================================================================

SELECT a1.machine_id,
       ROUND(avg(a2.timestamp - a1.timestamp),3) as processing_time
FROM Activity a1
JOIN Activity  a2
ON a1.machine_id = a2.machine_id
AND a1.process_id = a2.process_id
AND a1.activity_type = 'start' AND a2.activity_type = 'end'
GROUP BY a2.machine_id;


