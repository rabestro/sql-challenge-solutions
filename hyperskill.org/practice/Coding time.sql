/*
 Find the average mark for each subject,
 along with the number of students who took that subject.

    The result table should require:
    - subject
    - average mark
    - number of students
 */

SELECT "name",
       ROUND(AVG("mark"), 2)        AS average_mark,
       COUNT(DISTINCT "student_id") AS number_of_students
FROM "mark"
         INNER JOIN "public"."subject_type" st ON st."id" = "mark"."subject_id"
GROUP BY "subject_id"