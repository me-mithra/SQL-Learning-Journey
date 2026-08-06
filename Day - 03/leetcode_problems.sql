-- =============================================================
-- Day 03 - LeetCode SQL Practice
-- Topic : Aggregate Functions, GROUP BY, HAVING
-- Problems Solved : 3
-- =============================================================


--====================================================================
-- 1.Not Boring Movies
-- https://leetcode.com/problems/not-boring-movies/description/
--====================================================================

SELECT * FROM Cinema 
WHERE id%2 =1 AND description!='boring'
ORDER BY rating DESC;

--====================================================================
-- 2.Confirmation Rate
-- https://leetcode.com/problems/confirmation-rate/description/
--====================================================================

SELECT s.user_id , 
ROUND( COALESCE ( 
    AVG(
    CASE
    WHEN c.action = 'confirmed'
         THEN 1.0 
    ELSE 0 END),0),2)
AS confirmation_rate
FROM Signups s LEFT JOIN Confirmations c ON 
s.user_id = c.user_id 
GROUP BY s.user_id;

--======================================================================
-- 3.Students and Examinations
-- https://leetcode.com/problems/students-and-examinations/description/
--======================================================================

SELECT s.student_id ,
       s.student_name , 
       su.subject_name,
       COUNT(e.subject_name) as attended_exams
FROM Students s CROSS JOIN Subjects su  LEFT JOIN Examinations e
ON su.subject_name  = e.subject_name AND s.student_id = e.student_id 
GROUP BY s.student_id , s.student_name , su.subject_name 
ORDER BY s.student_id ,su.subject_name;

--==============================================
-- Total Problems Solved : 3
-- Concepts Practiced
-- ✔ GROUP BY
-- ✔ COUNT()
-- ✔ AVG()
-- ✔ LEFT JOIN
-- ✔ CROSS JOIN
-- ✔ CASE
-- ✔ COALESCE()
-- ==============================================

--========================================================================
--  Key Takeaways

-- Aggregate functions summarize large datasets into meaningful values
-- GROUP BY creates groups before aggregate functions are applied
-- HAVING filters grouped results, whereas WHERE filters individual rows
-- COALESCE() helps replace NULL values with a default value
--========================================================================
