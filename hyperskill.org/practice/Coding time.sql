/*
 Find the average mark for each subject,
 along with the number of students who took that subject.

    The result table should require:
    - subject
    - average mark
    - number of students
 */

WITH subject_average_mark AS (
    SELECT
        "subject_id",
        "subject_type"."name" AS subject,
        AVG("mark") AS average_mark
    FROM
        "mark"
    INNER JOIN "subject_type"
        ON "mark"."subject_id" = "subject_type"."id"
    GROUP BY
        "subject_id"
)
SELECT
    subject,
    average_mark,
    COUNT(DISTINCT "student_id") AS number_of_students
FROM
    "mark"
    INNER JOIN subject_average_mark
        ON "mark"."subject_id" = subject_average_mark."subject_id"
GROUP BY
    subject_average_mark."subject_id"