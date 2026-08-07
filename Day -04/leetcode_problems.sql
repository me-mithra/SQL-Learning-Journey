--================================================================================
--1.Queries Quality and Percentage
--Link: https://leetcode.com/problems/queries-quality-and-percentage/description/
--================================================================================

SELECT query_name , 
ROUND(AVG(rating:: numeric /position),2) AS quality,
ROUND(SUM( CASE 
WHEN rating < 3 THEN 1 ELSE 0 END )*100.00 / COUNT(rating),2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;

--========================================================================================
--2.Percentage of Users Attended a Contest
--Link: https://leetcode.com/problems/percentage-of-users-attended-a-contest/description/
--========================================================================================

SELECT contest_id,ROUND(COUNT(contest_id) * 100.00/
(SELECT COUNT(*) FROM Users),2) as percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage desc , contest_id asc;

--================================================================================
--3. Project Employees I
--Link: https://leetcode.com/problems/project-employees-i/
--================================================================================

SELECT p.project_id,ROUND(AVG(e.experience_years),2) average_years
FROM Project p JOIN Employee e ON
p.employee_id = e.employee_id
GROUP BY p.project_id;


-- ================================================================
-- End of Day 04 - LeetCode SQL Practice
-- Problems Solved : 3
-- Concepts Practiced
-- ✔ AVG()
-- ✔ COUNT()
-- ✔ SUM()
-- ✔ CASE WHEN
-- ✔ Percentage Calculations
-- ✔ GROUP BY
-- ✔ ORDER BY
-- ✔ JOIN
-- ================================================================
