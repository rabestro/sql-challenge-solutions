/*
 Write a SQL query to identify the top 5 – performing students based on their average marks across all subjects.
 The query should return the student's name and their average mark.

 https://hyperskill.org/learn/step/31086
 */

SELECT
    s.name,
    AVG(mark) AS average_mark
FROM mark
INNER JOIN students s
   ON mark.student_id = s.id
GROUP BY student_id
ORDER BY average_mark DESC
LIMIT 5;