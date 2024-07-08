-- Write a SQL query to find employees who have the highest salary in each of the departments.

WITH
    max_salary_in_department AS
        (SELECT
             departmentid,
             MAX(salary) AS max_salary
         FROM
             employee
         GROUP BY
             departmentid)

SELECT
    d.name       AS "Department",
    e.name       AS "Employee",
    m.max_salary AS "Salary"
FROM
    max_salary_in_department m
    INNER JOIN department d
    ON d.id = m.departmentid
    INNER JOIN employee e
    ON e.departmentid = m.departmentid
        AND e.salary = m.max_salary
ORDER BY
    m.max_salary DESC, e.name DESC;