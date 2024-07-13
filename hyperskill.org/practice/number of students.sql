-- count the number of students in each faculty. Display the faculty name and the corresponding student count.

SELECT f.name, COUNT(s.id) AS student_count
FROM faculty_name f
         INNER JOIN students s ON f.id= s.faculty_id
GROUP BY f.id