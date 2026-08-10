--=============================================================================
-- 1.  Second Highest Salary
-- https://leetcode.com/problems/second-highest-salary/description/
--=============================================================================

--Approach 1:

SELECT(SELECT salary as SecondHighestSalary FROM Employee
ORDER BY salary DESC LIMIT 1 OFFSET 1);

--Approach 2:

SELECT MAX(salary) AS SecondHighestSalary FROM (
SELECT salary, DENSE_RANK() OVER(
    ORDER BY salary DESC) AS ranks FROM Employee
)
WHERE ranks = 2;


--=============================================================================
-- 2.  Consecutive Numbers
-- https://leetcode.com/problems/consecutive-numbers/description/
--=============================================================================

SELECT DISTINCT num AS ConsecutiveNums
FROM (
   SELECT num ,
   LAG(num) OVER(ORDER BY id) AS previous_num,
   LEAD(num) OVER(ORDER BY id) AS next_num
FROM Logs)
WHERE num = previous_num AND num = next_num;

-- ============================================================
-- End of Day 05 - LeetCode SQL Practice
-- Problems Solved : 2
-- Concepts Practiced:
-- LIMIT / OFFSET
-- DENSE_RANK()
-- LAG()
-- LEAD()
-- Subqueries
-- DISTINCT
-- ============================================================
